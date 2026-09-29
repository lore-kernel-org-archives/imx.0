Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466CB53E310
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695080; cv=none; b=fL0UDZrYAS2a6SLH1ZbRAmoG+gJv32d9jR8w5sxR8bJ6ExIhKza+WZsqdFAOE/JLf+7nBqzWyoYGLTHJdfp92rGCiwLyTm8qtY6DcLLQbYFd29v/QJxFeP7Br+D4FjIJUPf+P4ZYG1Vpr7TBnrZUiauxnu+2gUwQ8jNRcOgqf0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695080; c=relaxed/simple;
	bh=5lJ/BsrMrjUPA//hbCE/BIQ7KBCnAQZQan4mp6ZdTv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxz9Xd92hx5sivTBm47b9C+fzPAGNqn8+wsDKss9S3sCu4I5vSpJXYwnCLGpPKv9kZV7NPhUeEKEWIdgai36rQSF7yGjpv5A3oiHOstTyOR94pnhGwq08lvobcbSsqs1jyE3FgD44DAtiDm0Y60VqPq6AYaCZLitwwfkFxFqHgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGqU/EAu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGqU/EAu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so34036865e9.3
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695068; x=1791299868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhS8YlnsGyJ9HS0RFtDMzIqZYstk1VURk3XTCd55V0Q=;
        b=FGqU/EAuSNjwbI8RHircR/Iwysp8Eu4pnlQ6IBCVzeqqK/URsedLp2tFf024hWnk1X
         f9jinBX/SbpqXiYyl7FCWBVN12orUwaKorR3GqBNvc+fmYv0qPXr8Sk72nd4cLAeoGBT
         5YSby7F9W1s5mLwMts1VmAysBoPPBqNj3JoCqaDJ+eDKQqr+N4thmfe3MGtrNVPxKBGg
         f135Dm1dToR4sSvOl1qTkHUzQZeAaFAZjC7OJBEV7XuaQEhgt+k7+/7UAOqq3/1YNHsv
         UsgnhgqXUKdeVMBdJYcQjUFfw/pvWgqzUMRdbWg2cHJEqm4j3R2SVLcVaWBT9snn9EBj
         VJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695068; x=1791299868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhS8YlnsGyJ9HS0RFtDMzIqZYstk1VURk3XTCd55V0Q=;
        b=PqchBZv931xK2Vkl/2NYk/0foemJxueXNcSjgJbQ0UipcJdLXZNmC4AQ1JYiZfP6Kf
         oOGykt37MafTOGYSIUQiyggRKys0YU7OaXBVNxhWFGZEM+doDazPVvurdkHXOk4QEo39
         IGLJ5P5lwGFOa8AU/4tzbIUigXP+FCRBXh3bXqS35EF0wVAtonSO+hE13ctIbpcyF65b
         mFsTH+7z34BG4iVpNsFgdCwmAK6HxQbIB3UTwAzjU7EttAhOIFMuk2GX6gBDhW21D5AX
         g6gl223vtFHG3tOpw4yX54HN7fHFwHMniP20o6bia8NnPdsBP6uEjW4KthJYvTNcWLSW
         mclw==
X-Forwarded-Encrypted: i=1; AKwUvBwE6F5j1aOsDywGOvelu0idlgw6s2Cwbno+v8uDpHTzP3hifKFg4mzZGC0o/XAkvb6wRJ8=@lists.linux.dev
X-Gm-Message-State: AFuF++mr/u4KEyKhNkjkJ5F0jHJ7HJPaAHN8iyFuGE+9zlsItA7eF9F8
	mH6enUT5bF2w4UXYUhtgcSe9jxtDlxBBanTgBPfWRs8FV2SiFXi6piGQ
X-Gm-Gg: AYBFou0PjUbbu54Zzj23mhFkvpdbHXFdEh3YIkOZF84vOMsFAlBxlQDzCzoYEkyAqXH
	ldxzGe4WNb+7A0OnbvJ/vL23j49GYxDI09KrCjstTracL/ZPBXDHbvaeubIqt1SW42EQyuv96PA
	pFzPlmH2bUJS9xlNBN1rVPsaY2V5fSmUs2SVMAeNUvFH3BL1b+hfYdqrHzjnvPKvZoZjx1I7At0
	aeZ3dgozGPTj1h+3/zDf0lb+kvNkGm+FBS4hHxQ55XfaaXG62EurQ/ZhMj/SpCmrsEQnlHis1eK
	UfXeOGhAN0mQjHP/kEKIoBtx+pjxp60R7gp4i8nTd1xIh5syUw3SoOf8QtTVL47QqdNlPO/bLcQ
	gkTInxkxllGfN5Sj8M942AfdALqG/seh0LoKePbTeUF+FLsfnVINWrG7oyDP89L2WdZgmjyCATG
	y/kmTmXi0qmJTvOC/l8XGDKckLVHZ/GToUdmE0NRdIlkRQ+iCdAdmbcqF6cuV68g5+WCCEq+7bo
	McFOHQ0E9EdYgBbPkSfcDIuJ4O4/ybEGb5CEnpRY21hjSl82PtLMtWBSfYwmUcT1G00ADcNMTEj
	BWAeuzxKfe7QgdhSe2Tykg==
X-Received: by 2002:a05:600c:8486:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49fe66b426bmr281786245e9.12.1790695068130;
        Tue, 29 Sep 2026 08:17:48 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:47 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
Date: Tue, 29 Sep 2026 17:17:29 +0200
Message-ID: <075691831d4da249672c3141ab16b9e856ee42da.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 233687131adb..9b1224091e01 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -834,9 +834,46 @@ properties:
           - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ull
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+          - enum:
+              - variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+              - variscite,var-som-imx6ull-emmc-sd-card-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-symphony
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ull # Variscite VAR-SOM-6UL SoM (6ULL variant)
           - const: fsl,imx6ull
 
-- 
2.47.3
