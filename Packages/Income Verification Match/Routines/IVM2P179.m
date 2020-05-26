IVM2P179 ;MNTVBB/DTA - Update/Add DHCP OUTPUT LOGIC; 3/13/19
 ;;2.0;INCOME VERIFICATION MATCH;**179**;AUG 13, 1993;Build 5
 ;
 ;Post-init routine updating entries in
 ;the IVM DEMOGRAPHIC UPLOAD FIELDS (#301.92) file
 ;
 Q
EN ;
 ;
 D START,ADD,UPDATE,FINISH
 Q
 ;
START D BMES^XPDUTL("DHCP OUTPUT LOGIC, Post-Install Starting")
 Q
 ;
FINISH D BMES^XPDUTL("DHCP OUTPUT LOGIC, Post-Install Complete")
 Q
 ;
ADD ;add a DHCP OUTPUT LOGIC string
 N IVMC,IVMX,IVML,IVMIEN,IVMFN,IVMSTR,IVMS
 D BMES^XPDUTL("Adding DHCP OUTPUT LOGIC to file 301.92")
 S IVMC=0
 F IVMX=1:1 S IVML=$P($T(ADOL+IVMX),";",3) Q:IVML="QUIT"  D
 . S IVMIEN=$P(IVML,"~")
 . S IVMFN=$P(IVML,"~",2)
 . S IVMSTR=$P(IVML,"~",3)
 . S IVMS=+$$ADD30192(IVMIEN,IVMFN,IVMSTR) S:IVMS>0 IVMC=IVMC+1
 D BMES^XPDUTL("     "_IVMC_$S(IVMC<2:" entry",1:" entries")_" added to the IVM DEMOGRAPHIC UPLOAD FIELDS file (#301.92)")
 Q
UPDATE ;update DHCP OUTPUT LOGIC string
 N IVMC,IVMX,IVML,IVMIEN,IVMFN,IVMSTR,IVMS
 D BMES^XPDUTL("Updating DHCP OUTPUT LOGIC in file 301.92")
 S IVMC=0
 F IVMX=1:1 S IVML=$P($T(UDOL+IVMX),";",3) Q:IVML="QUIT"  D
 . S IVMIEN=$P(IVML,"~")
 . S IVMFN=$P(IVML,"~",2)
 . S IVMSTR=$P(IVML,"~",3)
 . S IVMS=+$$ADD30192(IVMIEN,IVMFN,IVMSTR) S:IVMS>0 IVMC=IVMC+1
 D BMES^XPDUTL("     "_IVMC_$S(IVMC<2:" entry",1:" entries")_" updated for the IVM DEMOGRAPHIC UPLOAD FIELDS file (#301.92)")
 Q
ADD30192(IVMIEN,IVMFN,IVMSTR) ;
 ;add/update entry
 D BMES^XPDUTL("   "_IVMIEN_"  "_IVMFN)
 N IVMFDA,IVMER
 S IVMFDA(301.92,IVMIEN_",",20)=IVMSTR
 I (IVMFN["COUNTRY")!(IVMFN["COUNTY") D
 . S IVMFDA(301.92,IVMIEN_",",.07)=1
 D FILE^DIE(,"IVMFDA","IVMER")
 I $D(IVMER) D BMES^XPDUTL(IVMER("DIERR",1,"TEXT",1)) Q 0
 Q 1
 ;
ADOL ;STRING
 ;;70~TEMPORARY ADDRESS ZIP~S DR=.1216 D LOOK^IVMPREC9
 ;;71~TEMPORARY ADDRESS COUNTRY~S DR=.1223 D LOOK^IVMPREC9
 ;;72~TEMPORARY ADDRESS COUNTY~S DR=.12111 D LOOK^IVMPREC9
 ;;QUIT
UDOL ;IEN^FIELD^STRING
 ;;73~TEMPORARY ADDRESS PROVINCE~S DR=.1221 D LOOK^IVMPREC9
 ;;74~TEMPORARY ADDRESS POSTAL CODE~S DR=.1222 D LOOK^IVMPREC9
 ;;QUIT