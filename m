Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987365;
	b=QQL2cWeHnPwgD/eNzsfinYBAETK67yu2EnGS21JOBMyUjgtmevd1zEnkycoegj16jHRw
	 pubx9drNEpdKLhAsvGT5fy3wTZ4eitdg24q1I8m+KhB/DrbVwDiUrN372l86VflEqUHlR
	 xa4fdV76sxGoZT2NK9kH5bwC6iJ4aD/30cylVLUsO5VbumMV1vaohTXwkG43DsZBEdPW1
	 KryotpYoNvDSw3Ac4HplYbu6MIEAM+SeIK+u2N656r4wbcQnmHk4aCbZNXELf+e6UB4t3
	 vTv6Z/luHFN85byfn0iINqJJbhihgoeUtwAIke/nMSnPEaBa3W8z49JAN38Ch+QFReg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
	b=yjsXCyocCnrF9FUdw2HpjPeVTYujIGZXpE1t2OlmXrGRnf9a246OGOnWiYMTssWvb1EC
	 yhwtuTjJ2hve85D/BL1Hrl8sbiy/CdIelvKhdjr3Sgv/9NHeWe5Kp+5D/e8lvD2JrGRIM
	 uv9wuVXBuYXPPgpL8Y4C2J5sOK/ieZP0qZle/6It2p2XwRHBOp45gXpSyitnbC8gmJ7Pr
	 9kN7JtpIv/fx6AmoPOGr+7fgM0aTOyOBCyjrvfNrGn3xjOuAHZ6HY8g3G2Br5Lenr4LEa
	 yMdAHArHzhHFC7Dcw17bfdkCUBHkLR4C9hYpJs+jTWqSLUsk3Ce+ofYn8vzCiGHBm2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WPEcwfQo;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC6606A31A
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54EC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WPEcwfQo
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e96502e447so21868215ad.1
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 21:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987365; x=1793592165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
        b=WPEcwfQoDQvtL29tHVZM9QKAtzIpBmvGf9hrpijIzTgYCuXaq78plIFNjXCFoO2N6j
         2WQHzYGQU1DrwiTHO8KaQiDhYBXcJxjJB04jj1xhf8xK1QOkmfvmgKb4/866IiUQmOk9
         R4yGmi58NAW5V9kk7pm24MchLBiso1sNEVpO4aLdGOhQbgBAfE+PFPdbJNVAbhBj+0LM
         +MycDPwavdkeN9YKVlls8DlEVmlplSrfiUsdt6nvkuWFHJK9elLYsplS2zQcItJBRpgf
         VCr+bFe+gno7J8PsZl6fyqSy3kty6To92P2q35jjFnhoTef5Yt6txASaEJJORYftA7Ae
         KlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987365; x=1793592165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2jKhwM+YQiKdSr1TcQzqEzMoQpUEpx9bgQiDQX0OfY=;
        b=JfD0/mH57X3VOVGd0iv46lgiscFXRYXQg15YJc0zidTtZKZYZdCujIyjI3c9nQ0/A3
         x0ht0kXdmNfeQdLmzJ+3hvlgXKjsiuyuprBSuDzOI5eMbnU2fPpAYqxEZD17qIjtSVPb
         gEtcM5GFKAKmf/9WAZ1PLLQ1gegFF9NV40X+fLz9p9hHaP7PgL7oJfMtrUxrj/93y5ix
         ceEHycLyTxl0YpP7EyRIdDVNnnYCVvNVFnjJMSJA6eRp4XzhTXzdd1puQUev6KZSDvzy
         krn4xFA4WIJjuKbI+0H2tMXTjZ9nJIF3QU0S9esSubW9cRR6PmduiP3z+IQ2LvD/jvz8
         ZTCg==
X-Forwarded-Encrypted: i=1; AKwUvBxlMGTH3oXP/3slXzlJ+f2KYwqlSKwAPMflOLZmMMTLOUF0QCmHnT+EgOAm2taXHVG0uBM=@lists.linux.dev
X-Gm-Message-State: AFq9FYK/4fT8zn8PZ0vQLI1/nMKZ27WVHuf1Y/0YHSCUvmMW0wzUaR00
	hJNQnDEVajRxs0hCQADG8L6QM2a/fJALbTkCjeq079Svu8nDFk6z2gJU
X-Gm-Gg: AYBFou3s49pA5RKIpMk2KylqqDZtKQGFaBUNVUfSbOaB4OYeTzVq11LIr4XSMtuxQfu
	FWOhvJ/J8OXrg5xsDaUMvT8e8Rhy7AXNBKtkJadZdStkYxTrxPoqyWWz5oDBI6PDew0LF8e8SJY
	sgcwXPf/4bKMU6CnWQYLK9FhcwATUJ8K3gKSSmwSzLQRp56Y8rCykUlRkHP4hImi64MJw/jZT8v
	4U9iL1L18HYSF05VZ81t8M7K9DOpVilVQynuGpZgFrzB78M/cyby6clfTjOU5vTGYze5bddYEDm
	5bsHV+4/skXGhg/SLaY0RPwQ90uFRdyYnmLnb2R2AGYrR/IEbGdTci71euZNMbJUn8uz47vVKlG
	VzQicBN0alub/0lJFPUl3OqJQYpePQOzdrasWDiJKCnHz7OeieYJ5GYEkYF6WD31Q2c73SMkKJq
	hRZ3Zit0pXiQeVDYeoq/EqzyZaFvQ7UEwa+pjFPnGtK+5FjMWtMfDNbnUZNJ5tpvBXtlIR6cd2a
	8aO5Mh2cTt4f0XKV2NMR9jRfe8/7af/ZU/n4zhPtFBm9fyXm+P8JN4a49JETcaDUkIzIuv/OVNy
	TOVSMt/aBIK/zpMSabU=
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr46730195ad.17.1792987364597;
        Sun, 25 Oct 2026 21:02:44 -0700 (PDT)
Received: from xiaolei-VMware-Virtual-Platform ([219.142.21.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b22416bsm10626705ad.72.2026.10.25.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:02:43 -0700 (PDT)
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
To: aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	kernel@pengutronix.de,
	s32@nxp.com,
	linusw@kernel.org,
	s.hauer@pengutronix.de,
	sudeep.holla@kernel.org,
	cristian.marussi@arm.com,
	peng.fan@nxp.com,
	xiaoleiwangxiaolei@gmail.com
Cc: linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: imx: scmi: replace custom dt_free_map with pinctrl_utils_free_map
Date: Mon, 26 Oct 2026 12:02:30 +0800
Message-ID: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

pinctrl_scmi_imx_dt_node_to_map() kmemdup_array()s the pinctrl configs
of every pin into map[i].data.configs.configs, but the driver's own
pinctrl_scmi_imx_dt_free_map() only frees the map array itself. The
pinctrl core releases maps through pinctrl_dt_free_maps(), which calls
dt_free_map(); the duplicated configs are therefore never freed and leak
every time the DT node is parsed, e.g. on each (deferred) probe attempt.

Replace the custom dt_free_map with the core helper
pinctrl_utils_free_map(), which frees the configs of each
PIN_MAP_TYPE_CONFIGS_* map before freeing the map itself. Its
signature matches pinctrl_ops.dt_free_map(), so the driver-specific
implementation can be dropped entirely.

Detected with kmemleak on an i.MX95 board (FRDM-IMX95).

Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")
Cc: stable@vger.kernel.org
Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 613552e35070..8cbd66950848 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -153,18 +153,12 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void pinctrl_scmi_imx_dt_free_map(struct pinctrl_dev *pctldev,
-					 struct pinctrl_map *map, unsigned int num_maps)
-{
-	kfree(map);
-}
-
 static const struct pinctrl_ops pinctrl_scmi_imx_pinctrl_ops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
 	.dt_node_to_map = pinctrl_scmi_imx_dt_node_to_map,
-	.dt_free_map = pinctrl_scmi_imx_dt_free_map,
+	.dt_free_map = pinctrl_utils_free_map,
 };
 
 static int pinctrl_scmi_imx_func_set_mux(struct pinctrl_dev *pctldev,
-- 
2.34.1

