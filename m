Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176FE3A641D
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 20:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768941555; cv=none; b=iC83RkYbhUglWOd8n3HCvFt+5+GamxCPNdjYs9mIsrMqR8TtMe2ETMAOujuCPgH8f2zaceG/E7v6/crron/Axct0ynsQh/3CHFi5yi1Uvei6VvLPso4Tl8DdngLwHIUZ25d19Uh0OiJY6AymmyGssuBX7QBl9ooFTviaXX9zBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768941555; c=relaxed/simple;
	bh=xHOEY7pj9A80Sy6IzpJUThtTf0+b2ch1RqET3iZnUTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usQBu/kriwNKLss9NAT3iYjY1k6ktK7N7HcpF7mojS6ksNIKh5zPHO47LhglE392fI3h8Dzf52j5rFNOXYj20X2bgqteAj1L20KqQ3BfAzZClUNeqE3VN5or3ZgQaOeVfH+fWTr/NDxJKJa03uJ9ZAeA+xla/v3rQ9fGdANSaUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ9z1/vz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ9z1/vz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801d21c411so21043765e9.3
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 12:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941550; x=1769546350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2eD+o7ZJqt8UHgxhoi1YhoZ79UecJ91Sm+qVMqrNb8=;
        b=gZ9z1/vzz8p1hEzgg3qfCOMJoz5Rm0jqkx1PsmSP/nGbffkqE3IB65+RryqNR9ShjT
         nPyHygbNMqqftyj+hqxBMNu53CvBhPoCL/MvQQFeMl5GYbdkZ/VjU6zywy/wy58GuRx7
         vlV3EElIeOGhnADG8urSK6K85i4t6bcxYnihBIR3ecrNjxU9TEBuVkzdIy7jscrMOFtm
         h7IAa3Kt9rj03zBoLK34I6Oy1e3qUmEyvxf+e5ZNlLJ8a0C1/KNb6axytuyGNKMXvCoV
         MTwRkuShHP+SyFlkJQlJJM96ZHYCuE2GtiE1o/e4LG+YDjopd48OuRuxGxZknlHlTnz3
         PAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941550; x=1769546350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b2eD+o7ZJqt8UHgxhoi1YhoZ79UecJ91Sm+qVMqrNb8=;
        b=RWrE/uvFNyG/ujPXJcOrowq7hpwBhW9gQ9If8M08pMkvfSv+ByFgWB0UNBjL4ZTb6M
         beDT++nMXXYxEA4aTfRm0R9m9ZBXNBkTt7E4RUk1Rj9at/E0EN24VQOBCCnKZ3R1bYRn
         dZ6CEELzesA5xB1P5+Cf9ZT9sTR0cN31FDwh3F3ImJTrrGjPK4GQ1d4RVqgs//jf84QU
         YsZlP07+exdqkJn5RV9hpcRwXV21JnA7hzSKVgYsw4RYaQ5doufskAeoj54E9y++PqQN
         FGUqRUnu5l6+sJTN1gjAmSZIlS+DwUaUrTijlDxsMkTIRpOfIIjE3HteF7A3w216I4UN
         /3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdUQGVUTD+OHaJ1Duuko5mM2tIaF8e2hGxeUZS2rXJP2CMOIK5K3kOwc6/pPWm9gSrnjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnRsUUOnwr7jDKO23HONn0QxTQKv1OYH3vN/YSJeS3VaPdgJ8d
	64CbxU26MEwRcw+2v6dpnglKWnxPtClNwMl2NMYvZJa01tgHTgl2PfnB
X-Gm-Gg: AY/fxX5apnYzV0wjonrEhdJr6YwuHhKHtjZ097huFvkBu2VccXZGKZi+6A5FUSxQsNT
	rASMrIHosjYOz3yb0rbk+2BZrQ9WNADrhlIHhzX7ldPUwKuE+wW/AQ2VsPFN6H1RD6XblFSaqZ8
	xu9PKW3yEReMQZrTZQemXi/tZF+mZHlzWRpdynASIemkM0ZSy34kknTijvJfAkjwxvV/jRFd6st
	5xfjtbVBiAAH2MpHi2a5/7sniWXs6sLben2VLMZ4AAAGJ0B4SrfTDhDWIWRiSTzqto91Fn8sFh8
	eLQrmvrAuJLGUr7TLxnQytWAAEjJpKWNQ8AH6lXoU6iJFnSF9ZJ5K9PuKqNTkiwrpFE87AVLnpU
	LQS+m5MKG5VSWkf+PF39Nj3FLafKlns8/iFohmejj2jOxXon6diXVMIvw3ojFR9Ug+XLx+PzliD
	1uM0wJgMVe7upSCgjq
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4801e2fbd61mr211779815e9.1.1768941550130;
        Tue, 20 Jan 2026 12:39:10 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:39:09 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH net-next v3 2/3] net: phy: micrel: add option to keep the preamble before sfd for KSZ9131
Date: Tue, 20 Jan 2026 21:30:03 +0100
Message-ID: <20260120203905.23805-3-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

If the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag is set in the
phy_device::dev_flags field, the preamble will be kept before the start
frame delimiter (SFD) on the KSZ9131 PHY. This flag is not officially
documented by Micrel. However, information provided by NXP and Micrel
indicates that this flag ensures the PHY sends the full preamble instead
of removing it. The full discussion can be found on the NXP forum:
https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/net/phy/micrel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 05de68b9f7191..a51bfe4a8d7b5 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -101,6 +101,14 @@
 #define LAN8814_CABLE_DIAG_VCT_DATA_MASK	GENMASK(7, 0)
 #define LAN8814_PAIR_BIT_SHIFT			12
 
+/* KSZ9x31 remote loopback register */
+#define KSZ9x31_REMOTE_LOOPBACK			0x11
+/* This is an undocumented bit of the KSZ9131RNX.
+ * It was reported by NXP in cooperation with Micrel.
+ */
+#define KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE	BIT(2)
+#define KSZ9x31_REMOTE_LOOPBACK_EN		BIT(8)
+
 #define LAN8814_SKUS				0xB
 
 #define LAN8814_WIRE_PAIR_MASK			0xF
@@ -1500,7 +1508,11 @@ static int ksz9131_config_init(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	if (phydev->dev_flags & PHY_F_KEEP_PREAMBLE_BEFORE_SFD)
+		ret = phy_modify(phydev, KSZ9x31_REMOTE_LOOPBACK, 0,
+				 KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE);
+
+	return ret;
 }
 
 #define MII_KSZ9131_AUTO_MDIX		0x1C
-- 
2.51.0

