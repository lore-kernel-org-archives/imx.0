Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624142;
	b=dr0ScMM8DB1sgmVaOTCSSTJsIU6vNJCGoIOyqjE30MGmQyviyB+fGxdUCSc0qd4Kwjmk
	 7mzhFR9jk66nHzYVP3h0p0Hzy3ONf/f/kpH/rmk/tJL9lHcl5fM6kDiAq9+s9s6cC7r4i
	 LVPhbrHpu96GEp/YuUB1B90T+d/PJcTBK215B9fDBKkcg40ZKLPt3VmQkDsef0NwadxAG
	 KkBujXD1Xw8XH4ng/fdqV+lcrnW3758pmdTINPcOoLM879kRaZyyhWynLVC/ezRGDouht
	 c/++/ZOoPBCWrbCcjLS8oDwBdWa+lEYvFPfKWpRY17eXGJM7ANeHkSc7KJdYVn+IVZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=;
	b=4mALeoFQSuj4y+fRD1FHtWlKsA25MjbKSEkNnwSn9lYa98r8tsS+znSe7QlpRDJX6kMK
	 nfGjhxlSJmHdpeGxcnu+u4wQaCv+epsxuYCmowP/+uWy5jfcntlRxe/y4nrMWB4JFPf6C
	 j0IgHQ8MRXt2juQc1AtDC/BTmMaHz3QNkSKOJzrio5wWLpCW5AgwU+bweaB7WY6pZ2fo8
	 L9aD5h1Bb0N+1OucZmqQOJ2FJfwnSrLWQIgDD+Gi19qmHuHuphpWxcGDyv3plgTi8kLZK
	 r/h5VgBse5D222D+TFC5MG85qj9dHUv2Ug+e9OAh/f0cBAFWVWqHq1fPiN0b1ckFiog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d4IRJI7i;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA12606A334
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA12606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d4IRJI7i
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so46733025e9.2
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624140; x=1796228940; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=;
        b=d4IRJI7iUCxnC/Qy0O1NnI5RMp0QtL7PJkufO7MfiD+EiTfnqt2PArPwRpLftH2GBM
         gaY+cwuuz6xtJ0+Degpc4PdfJeMZXkGMwvI280gEpZZWV+cVcauytLUFtbz4zaFTIOy4
         EMGTuqRMKFYWiOkkXq5du1aUw3mbt7U2x7NNxEoUlYdTfvpBG1iF/F0pbrOc1J5XGADw
         G9s90PuKrJU1T5xBqWqcqSgCPXUMtzw/GkXpgHV4b/2xwnzamY9M077kuLwEppYsK92R
         GIH6e5XFpZ07LFp3KyW3hioezIhTKS0oZOGtdwnMeH1ZJra2wpbmv6Ea6kMNOJlN0o+i
         Ervw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624140; x=1796228940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=;
        b=1JlTF/zvN5v1LR9J2oJePkYcxbB3I0xC30dVeLPaBJQlYHAEsrHhbIcnGCztTVz/Ge
         zk6AQUrEvN3JF75x0o5yxiSH60C8s3tr/jzQZo8KsXEUps+iwo4soN1SIf9kauojFTVZ
         ZkU6uJXjq+Y4edpGbyXVYRmyTUaLgcVI315sVSJLJqV1KU6gshY2FTnPcBgh9Kd5+Phe
         lnIlEMifaiN8N/gK/6LCCvxMvfCz/KrC2/ltaEyz+gaYmVcbdzutXkm8YJGtAbS8dj4o
         Q/QvcAW78OwDN0InSShF0ALtFCmplx2Kb8EBwcFWlYcBe35lh16VdWxigbhBYqmkcAyq
         FgPw==
X-Forwarded-Encrypted: i=1; AL+hErHbaOo+K9qpUyYTbJhVliq4byZyCQoKbix0zoiXxXKiDr++NPoMdEmVSpJIh7vG3uJLhl8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8EAosrayjMP62S+D1VIS0UWmZ2NymA+/sss8vEAfsrfVfPHGV3
	+3B8zZSa6AjXDrEFwY4E8KK+tHrv/FMZGGipTXRoK1g0YQWwz5jaP402lEyzvpW9KkM=
X-Gm-Gg: AZFdTZdXLJtfgXrGYB6sU3Ch5z4epu/RLjI2n6K+IBr5mgRWkObCGMRFN5RQDrrX1S0
	5dvJa/Fc51z4x8IzUxcan1OZzTDpeWp658qvWtCGBSsoVe+iVFuVsUHZDP3Sw5LqGofrNCF2XlY
	SIPi+DfKc4DFUGw0kiUdBwvNxI0x+MJx7z9QkqoVhV9eayvs2E3FsVDcpJLXokfsNquA96HYV8X
	QHMqqs9JamrwG2zd6uBy3wwb7to+I1Kvq6ba+L9mR+TxsYBg/IYa/wxKq62DK8ExktYJts8IBYO
	D8km7Mhl2NFNJriCAywh8zbooms1svjbLxCVxH+ALeRKTb05CS06PQ1qbLPEuY05yykWCDijV8k
	EgrEV1PuOPJSHzQ+/yWVxFqQ8O3xd+m/boC/rkTX0s9OBBnH73If8SShkUL0wimZUrJRfXbJGyP
	JNfsgy5BSEKDApv3rq8e9swCLbbp/tQpuhFPsIhqu4rO/4uZJzrXff1Ie4j6b+2p9cHx3MDtxFf
	y4RylK0ATYTTRF/sRhnerB02qu7ecR/R/OLQosIhEZQAUj9vUpvhyHoKXKk3CN76bgMsdiFyeRe
	oM6B2OU7UJfgLkLuC6qZTAXH8UTJqX4OLDtcBp6P4CU1xA==
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr469106785e9.15.1795624140547;
        Wed, 25 Nov 2026 08:29:00 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:29:00 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:36 +0000
Subject: [PATCH 10/10] mtd: parsers: Unify list terminator for of_device_id
 lists
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-10-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=5774;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=KOogzIvhzR8eYf+iMlhb8/yYFLWrj/S1PvoHnBRgitM=;
 b=VkPD+ID7sV7Ml7e/hOXMxbv8kZ5YRPTjrP5CRzexH7lH8bYIAqCXSWUv8DDuCLt6WWwVQ34Le
 OZotULTBoziBXkpCQurbY5qTiNItaA5MiH9TUJN3r3pgeSN9ESNfpKu
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/parsers/afs.c               | 2 +-
 drivers/mtd/parsers/bcm47xxpart.c       | 2 +-
 drivers/mtd/parsers/bcm63xxpart.c       | 2 +-
 drivers/mtd/parsers/brcm_u-boot.c       | 2 +-
 drivers/mtd/parsers/parser_imagetag.c   | 2 +-
 drivers/mtd/parsers/parser_trx.c        | 2 +-
 drivers/mtd/parsers/qcomsmempart.c      | 2 +-
 drivers/mtd/parsers/redboot.c           | 2 +-
 drivers/mtd/parsers/scpart.c            | 2 +-
 drivers/mtd/parsers/tplink_safeloader.c | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 7ab3d50f565e..eb6abf5330ca 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -386,7 +386,7 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 
 static const struct of_device_id mtd_parser_afs_of_match_table[] = {
 	{ .compatible = "arm,arm-firmware-suite" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_afs_of_match_table);
 
diff --git a/drivers/mtd/parsers/bcm47xxpart.c b/drivers/mtd/parsers/bcm47xxpart.c
index a412c0e7bd4e..ee7c81894b9c 100644
--- a/drivers/mtd/parsers/bcm47xxpart.c
+++ b/drivers/mtd/parsers/bcm47xxpart.c
@@ -301,7 +301,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 
 static const struct of_device_id bcm47xxpart_of_match_table[] = {
 	{ .compatible = "brcm,bcm947xx-cfe-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm47xxpart_of_match_table);
 
diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
index 6e7b1ae8f58f..78fbe8a681cb 100644
--- a/drivers/mtd/parsers/bcm63xxpart.c
+++ b/drivers/mtd/parsers/bcm63xxpart.c
@@ -153,7 +153,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 
 static const struct of_device_id parse_bcm63xx_cfe_match_table[] = {
 	{ .compatible = "brcm,bcm963xx-cfe-nor-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, parse_bcm63xx_cfe_match_table);
 
diff --git a/drivers/mtd/parsers/brcm_u-boot.c b/drivers/mtd/parsers/brcm_u-boot.c
index cd78e432f1de..d48d8ed73ca0 100644
--- a/drivers/mtd/parsers/brcm_u-boot.c
+++ b/drivers/mtd/parsers/brcm_u-boot.c
@@ -70,7 +70,7 @@ static int brcm_u_boot_parse(struct mtd_info *mtd,
 
 static const struct of_device_id brcm_u_boot_of_match_table[] = {
 	{ .compatible = "brcm,u-boot" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, brcm_u_boot_of_match_table);
 
diff --git a/drivers/mtd/parsers/parser_imagetag.c b/drivers/mtd/parsers/parser_imagetag.c
index fab0949aabba..686ef88e3099 100644
--- a/drivers/mtd/parsers/parser_imagetag.c
+++ b/drivers/mtd/parsers/parser_imagetag.c
@@ -202,7 +202,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 
 static const struct of_device_id parse_bcm963xx_imagetag_match_table[] = {
 	{ .compatible = "brcm,bcm963xx-imagetag" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, parse_bcm963xx_imagetag_match_table);
 
diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
index cf3bc9735238..db1129919084 100644
--- a/drivers/mtd/parsers/parser_trx.c
+++ b/drivers/mtd/parsers/parser_trx.c
@@ -120,7 +120,7 @@ static int parser_trx_parse(struct mtd_info *mtd,
 
 static const struct of_device_id mtd_parser_trx_of_match_table[] = {
 	{ .compatible = "brcm,trx" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_trx_of_match_table);
 
diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 1591aea48b28..d46555138978 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -180,7 +180,7 @@ static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
 
 static const struct of_device_id qcomsmem_of_match_table[] = {
 	{ .compatible = "qcom,smem-part" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
 
diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 120b2eab21fc..f8d421a88748 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -312,7 +312,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 static const struct of_device_id mtd_parser_redboot_of_match_table[] = {
 	{ .compatible = "redboot-fis" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_redboot_of_match_table);
 
diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
index ad6e9d5c3daa..e0bed5ef04d8 100644
--- a/drivers/mtd/parsers/scpart.c
+++ b/drivers/mtd/parsers/scpart.c
@@ -229,7 +229,7 @@ static int scpart_parse(struct mtd_info *master,
 
 static const struct of_device_id scpart_parser_of_match_table[] = {
 	{ .compatible = "sercomm,sc-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, scpart_parser_of_match_table);
 
diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
index b770f41ef874..e9b25e236eb9 100644
--- a/drivers/mtd/parsers/tplink_safeloader.c
+++ b/drivers/mtd/parsers/tplink_safeloader.c
@@ -138,7 +138,7 @@ static void mtd_parser_tplink_safeloader_cleanup(const struct mtd_partition *ppa
 
 static const struct of_device_id mtd_parser_tplink_safeloader_of_match_table[] = {
 	{ .compatible = "tplink,safeloader-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_tplink_safeloader_of_match_table);
 

-- 
2.53.0

