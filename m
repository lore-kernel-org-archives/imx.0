Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6903A8759
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562303; cv=fail; b=EoeAmZpCOJrv+k/hrbZEDG1uu8gfMpWa6W0YRIKbetNhI2ERkKVyiwsZL0GuTcjJUZQui7S06S+pLAuxNLV4mSqp8fovUoyybfqU1XsFg6YIkaim9K0uZQ7E4v98xpKFuIaKnSOfu4IKmnmzdcVmbLlMv4fxDr9M5BRebZiafjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562303; c=relaxed/simple;
	bh=xRnJ3evxyf9Ch/E0Ck5P/TaaVFakXOtCkmkRc7hX9YM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TFWHz8UMzY72/1l8ZKt2nro6R+0Pe3/RENezDETgDv0MmHtLTdTq15EbaQGI++oct0HH0NXg5fALsUWUFIsdVVXQSbziQJXne/+mTMtMNQnhJljsrjdAyNtk0pONajpnTei8vaG9mYoCTAxv4JrL08Fg5/rDSNpRO52Yu06LDRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AtAUMJ46; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AtAUMJ46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgIoHQevvVAQlVKa+QEoTYA/xhfZ/QJunvPe2p3VfLeTOS2KSMWqVvQEnaCrL1L8RBQvKOisC5BhRFqJ94x4Y1NeYL+3y17YWLR3x0zovwD9yq52OU46fhjTD4ECGkE6LroQ3eTQ0pu6e952ZsX+iZ7dnqmu77SaKvKJxao3jrmpRK3YVaW6Kq9lNOxhYaO8JORS1oYLF9aqyfFnsI9Gipu7GF4hW2LSp4wm/efBqDQt95Ij9DeT0FFMkzWnJcI9EpxsT6stwKdQpbYnKzNc8OrDvwYzGKNziNwdNkMD4aZBfHvrnLbqRrlkglX7rcf6tt5PTdlpz5NXZszz/7X/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eI4bRA2CyyViscikNpsGxrkYtDQ/GIpk2oebmZFqe7U=;
 b=Wo8skL8SqodFMcAcgJVL4Yk8zI1qPdMIG52yFEQznrWuQINJH0938nZcrWxO5Zc6TKo4SPJ1m+Xh0UP29ZDniCqxZvQhhv1WKNT/MBbPYjD9wA2L6lngbKirPxR9ag2B4XFQ4auY6KrNitPh2KtrqdbsTsguC7pvsv7fiJH/z6Jd2soryP/LQuKLaUyRaluW1zod6ed5ccz7O/GD8YqS6Kui82JqaCjahPOeoSe+TKSvcdGw1m/Xodic1SGGsiM5B5yf73O9XqpX2zgDMzJ04JM5hQe0WMC50pV6kcoKo8uLSBzVUcVLpUfFy57y2jcMK/AGOCj54kK5InB+O4vasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eI4bRA2CyyViscikNpsGxrkYtDQ/GIpk2oebmZFqe7U=;
 b=AtAUMJ46Y6q4s7QqsHYmUeyc9/ovRewBeHZ91uKs837iPRjZMlh/bUoTAkCrgLeEo9DIJ6Vxz7O2SJu+s9D15C88KWvL3PFe8RXwwthjMMapv8M/sjwyHNxcBYzyqn1OBGB5fTMeDbouKaizTdcWoEW5vP6X1EaBmWdojx37VgRrFOf7M/BfWepdwtMDUoXYKF8KSpljcuESkxg+SEE7QeJ7w3SG3MTN3Sj7ptBSDNmqb12ohpXYTLirCmeMDzrQ7FKeDvlDJKpjL9GC+PJZeXk7aobm3SUY2n94JtRikPBXoMxxcYFPeufXeh/vvLaEs7BBvvgrkolXrz222qEI2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DU0PR04MB9393.eurprd04.prod.outlook.com
 (2603:10a6:10:358::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:04:57 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:04:57 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: apw@canonical.com,
	joe@perches.com
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] checkpatch: Don't apply signature style checks to diff content
Date: Mon, 24 Aug 2026 18:04:49 +0900
Message-ID: <20260824090450.3268287-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0113.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DU0PR04MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 954f9482-2990-4250-b150-08df01bec4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	neKBXhu3ghB/UHh9Md83OBvRg1qmez1pOXdybVRGQzmMcTJLCJSRm1bdHhCLKIg3eHDo4zP/9QGvIrKdNjInSr/cd2cWP7wFN8hpaCMoIruvGZf1kLzkrIZ5GFRR8+/bhDJRGSVPo9qBcV7tp5fxf78f3G2Fm3QTf5QfZQOP8NEvRykzvBLJial3vS5M7KkqV0Fr/bgoZxL46GHXI00z+9KTA7AejXEGqsKwVDGM2k+CC+pjgvcLzz5zyWTFk9kpM9I/FsHV/2uBi9Jwb9eyDpWV3Pt1iBA7tV9tKKB6IOEBtvpwCFh1dI3bN5u5qVblyzk94R/8mDruT7gVY+bo6ponNQNkgRp9uTLGh1qn9JT8XjtTiB5vcJDxDKmjkGb9bVxuR3bwt5OaPHIVMT9q9/OgpVE6P7RvAjOt/y1ebw73kDdl9dwId+hO0FKpljOIIEp56IjDFttwl7dldYhDfXDctpB5ZJpc2e57ll8fdyhDFF7XPZ/ZD3qrkV2+gcHdNdqUQ7fi3R7xJvFtOjgxM6ws+xhV1RR84P31Zzx3WnOEIF+2sGXkRNBQMLnoegLf/ePclTlz7dkfPbOmIKLjNnmyRUVPieapxDuvx6Vt4R7bgVDpuAgrutbVYUzjygjIWQn7qtNqofj+rYhump4HQGCTnW962E6FaBZk+HWJm1I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HsZC+nEEBEdN7D/+ch0KBvYex8Cc4KPp0yDEZAn2roKHiCw+EJgZpaFI8OG8?=
 =?us-ascii?Q?lG5v1tLg4CSDMPkUxcsPSoZrxU9WgHsFyt6ArQARE7QJlGAUm9aXn7pESiqt?=
 =?us-ascii?Q?jME8FJjzrVlfsvZC3unEAEQ2XuuToXUiUyqWqejWWRqADl7ztwBuxHxfhd1H?=
 =?us-ascii?Q?pazrLvvJiGA/VyLnbAxZ1TrgS8poul0fDLM3L3tBr9d0FuPWCvXseGR2rig9?=
 =?us-ascii?Q?LbIpnf89V8prQvGqTwF03ucqwHb86d/u+JY1uci1RCq7lnBxhCdPCeR94Nj+?=
 =?us-ascii?Q?wIrw/np/4MIpPaQ6hIikmNx4Qh6ytSlxK+Nm2RNFW/rIgKallzjH7mtp8Ms9?=
 =?us-ascii?Q?C/6qNS0Z+8F0aY+vtmGPgNNRIRPmav6E2pqsDU4ZoWorZYEgFGXv/DoxvpGR?=
 =?us-ascii?Q?/o6qfrZPJ5Ufyw7DMaA58jDXazjUGuLJD61b2+6EBvVSRHA8MNskpuB8bqxn?=
 =?us-ascii?Q?q4hYIFvRmSsH+MWH1w6NcQyauVGCHoLyDQVieyAjcG7y6bHhy5XplQJbBjmq?=
 =?us-ascii?Q?CfmlVq2XdXJSdNNDEvR+3+qqnC2PJgZEJO9eRijon6SSDxvZzwlIqNvPpmR5?=
 =?us-ascii?Q?jtRn1MHkB77ky60dKtm7dIjh9YsxEtISPGQsPTFZrVqM72ANSRftjBpVh1bP?=
 =?us-ascii?Q?+DN9iEOBRfo7mErH5aut1wcS15peQ3gFXEDk+lq4Z9i/Xz8TITmWo0oW0kFa?=
 =?us-ascii?Q?UGjbFFFUH9d9uEQeZeLYuUM+TseYidxHiqpOs1zULY+MnJJwSyDXeAfWpBk2?=
 =?us-ascii?Q?nX9ZYH6/J8/4rYl0atWFeBz9bRDMm7fV12Ke+kvOLp4ldJAHqKNAk+qhj8cZ?=
 =?us-ascii?Q?Hia3NPpjYb2WOxZK7LsHPSEwIyKIim6fmsmUO48xzPUIBEnJTmexazy1L5ms?=
 =?us-ascii?Q?XxLVe2pAAyaKxXogC9FxVSXXHF0OBk43cO2QM3QDXrc9q7puW8ieiMU2WCOg?=
 =?us-ascii?Q?M0hfYYEgPsKF72iLVtWWf5N2E94FnxVL+U1mM21RbzY/dZUUDtGuniylbyXd?=
 =?us-ascii?Q?6XVe9MGLavjIVqhpyVdvCBmyRgxFpmVgIovANBchov5S1URQEelILd9J2r9b?=
 =?us-ascii?Q?reVqE8km3GS5R0wsJzRqbT2LASw8+3yISZjAxaJ6xpgugnJIWQyerR0Gyr2Q?=
 =?us-ascii?Q?ctN8JT6JZTLWKnEKrr+Qwanjc0a/oybw1uUT9/QES/qzJgM35+Vtlso7iiVJ?=
 =?us-ascii?Q?mWXE2ZHUXW8hl++Gn3X6URyiGqGYTJzndIroUsXpLP+/kbOt7XonihShKW7i?=
 =?us-ascii?Q?QPcEZzFpLmNyxQhB2pFZWMYF6E1W5g/GaZa10GQvBTStMFSywShDprJCJ7HG?=
 =?us-ascii?Q?C8tgVGgKbTCz0BArzGFiYtoj8Kg1fvUHpFXK9wS2V01k4/WwR3t2LZn/KC4l?=
 =?us-ascii?Q?sLhDBEA9Uxo6Vu4YUOSz3n671OZ1oFe2TK7Xz1J8Gk5VLb0OAPSK1puzirG7?=
 =?us-ascii?Q?IaqiPuwmumrW9Vk7IvbqvNtiPr2iN4l5sFjjpK9K83H7YzwOW5bJvQBSM65z?=
 =?us-ascii?Q?iUn8PJ4DxiF1bUNgk8IzlznRu7B7KiQaIPXq7gdQ322Nf3FxWku4mFDdfclH?=
 =?us-ascii?Q?MRVG9CSpJ/ySvW5FuKQMk+6+bDKdJV/N/Q1+//1eyokvNRkHRFN7PnqKGZ96?=
 =?us-ascii?Q?x3urkMZPji6wxoAvru1Ays5mQ/mijyPO+laOAEEkL0JMwAjRlhAjp1MYPUFp?=
 =?us-ascii?Q?L2QENhPzyx6JE7oWQFfdjpUsymEfNhQuRVFBFCEwzqbWgLIpw8RVR29KrgPc?=
 =?us-ascii?Q?vtwoUDzQ1CYeliCtv5n1RfKyagCgyrdKsiG3TnO5s4QP9rBg0awA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954f9482-2990-4250-b150-08df01bec4ca
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:04:57.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlQ5ZQZ+H9iSHnqV+3+uLnmQBh0VcFl7Gu8kRIH31LgoT2rd8zUYiWE7kvJwjVT+oj3S9ZQlzvmkrWIeHpCVNv0hsRoXcweOkWBkx0q/62CNMxNTzjgztTRvdDlFH3AZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9393

From: Chancel Liu <chancel.liu@nxp.com>

The "Check signature styles" test is guarded only by !$in_header_lines,
so it also runs on the diff body. Any diff context line that looks like
a "word: value" signature tag is then flagged, even though it is source
code rather than a real sign-off area.

DTS is a common offender. A label line whose name ends in "by" (for
example a "..._stby:" standby regulator label) matches the
[a-z0-9_-]+by: pattern, so checkpatch mistakes it for a signature tag
and emits a bogus BAD_SIGN_OFF "Non-standard signature" warning, an
"Unrecognized email address" error, and a "whitespace before" warning.
The problem shows up when such a label appears on a diff context line.

Reproducer (build a self-contained mock patch, one printf per line then
feed it to checkpatch):

    f=/tmp/r.patch
    printf 'From: A B <a@b.com>\n'            > $f
    printf 'Subject: [PATCH] t\n\n'           >> $f
    printf 'Body.\n\n'                        >> $f
    printf 'Signed-off-by: A B <a@b.com>\n'   >> $f
    printf -- '---\n'                         >> $f
    printf 'diff --git a/foo.dts b/foo.dts\n' >> $f
    printf -- '--- a/foo.dts\n'               >> $f
    printf '+++ b/foo.dts\n'                  >> $f
    printf '@@ -1,3 +1,4 @@\n'                 >> $f
    printf ' \treg_can1_stby: regulator-can1-stby {\n' >> $f
    printf '+\t\tregulator-always-on;\n'      >> $f
    printf ' \t\tregulator-name = "x";\n'     >> $f
    printf ' \t};\n'                          >> $f
    ./scripts/checkpatch.pl --no-tree $f

Against an unpatched tree this prints the three bogus messages above and
nothing else; with this change it reports no warnings.

Signature tags only ever appear before the first file diff (mail header,
commit log and trailer), where $realfile is still empty. Restrict the
check to that region by adding a $realfile eq '' guard.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..498d9973cfc6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3077,7 +3077,7 @@ sub process {
 		}
 
 # Check signature styles
-		if (!$in_header_lines &&
+		if (!$in_header_lines && $realfile eq '' &&
 		    $line =~ /^(\s*)([a-z0-9_-]+by:|$signature_tags)(\s*)(.*)/i) {
 			my $space_before = $1;
 			my $sign_off = $2;
-- 
2.50.1

