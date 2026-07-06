Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A2443031E
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330514; cv=none; b=gmku3SLF/37/8q6bnd4ri1cCP4hXvCCrUMDV4pnt0o5npAE1G3e9HILogDNfW4cIx73TeN6d1aGgv1cDiD5Bz3PF5V55o+9fzq9nbpNkWdFDBoxHw7+jAaOgYLe29Yd00vJn18Axxc482d6fI9H5KV3npcb78vxo3Q5bvLQXZxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330514; c=relaxed/simple;
	bh=7WN54U2QmWBYjmzIh7xFRoxzzdn3vndoXYM27XhvjdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWJyYrmTknS2pdV8g1/MMA+LT+CHgt6hKM/mS5GqJKsP4RDCvIueCHPdfqBCiFKIAGGYjbAd7S5mkKlPYoCGhU/f64yXHqjrtYbVjkCnxraT5rpPm0BZlNCHLtJYJ90jNYF745+0UE0B9CcWU3M7no4GfPZrzxERc5XYzCyaLNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3YjqvCc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3YjqvCc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so30626545e9.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330505; x=1783935305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx4FBJmHhIhPwgpgVHtFQpg4a59/aBHMExozfwUf+P0=;
        b=G3YjqvCcDG9d0E0hbOdPNW3rlqMCN4xFqiJxWuvQvH2xpMKp+71yPPbSLUgsyp9yFZ
         X3HCRhtCdAwosgLz03xon2597Eb/6q3q6wQtQsodWPRAFx4q+eFFKWOtTELe3kMMDHG1
         llq7C+qeRyyc4J502Q75JykNhjy79+G7I9r2xOTtCvY6IayDnRiOFUuoqK0ywU4N0ce6
         LtULFcVaZBwmHtZL+akjOpgr8+5k1h3UxasrNUwFU4MoSBiFkgKvj2zptAakGvJ+jLTW
         3iV7ZasiOdn4Umk3cKYErhZMh688diVAdbe7aCIS9UA+JQ3tk96fwSoV0aCu6w6gYQrz
         NmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330505; x=1783935305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yx4FBJmHhIhPwgpgVHtFQpg4a59/aBHMExozfwUf+P0=;
        b=gWCY9IbJCnP6yP81sk0YTfBoddlG5A/bL2j7lWjy2G7oweuKRIcahUz4NTh+1PDhKy
         aO2f1WFnq2dKOLHxi8oM5G+R+g2G1AUANFBof3xUNX0y61/r/iZ3odJxNaxzCpTqJoxN
         5/n5TZ6ntuahCRS54paa3O6LHw55rNozW1JCLUyocSmw3cHhKMUXp5rWeG+OCYUfO4Ou
         tLph85OauC9yineufXN6aoidhINbFbDurEy9idXZF9LKA/uI1kRky30uul4vGa30Kov9
         Bfi9CIRs15+eH53jfA1ncm5pHY8gp+2iNQtmBnu3aJMlw+RlIk7LPki2Bv9vxC+SH9uX
         rppQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxH404kOmlT3OFzlG15Vn349shN2eFStkeDWJ1NpUtV7fH+B1r53egZkCuO/c88+CMcK4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzP+mrj2zuxCL1cf3rCFaR7M6G2pN6SMkR+rN20D8ViFaxTVID
	yeSTCtnyUWeIiRcfTfl0ClaLam7Cb08tCvf7KVVS+07CxlHAk0/onw4B
X-Gm-Gg: AfdE7ckCkPN12Vb/7NiZHMQIrh/EBmwns7d7hzIScnS+HVdPpKqaS+1cYS9cVFfGvhU
	1hYMPHxIEEZVkS9XSdGSiia5LyII8CzERvWzZ5g+YowgeEFzeSQkc+TN7TyXNp12qf0ns7+Cxnf
	z1MGf1TDYA7aiJDK/sMtaNAvA5tWumuqRQtvPSMXNfmi4Z9CVSoi2AAjCnc1a4BB7eGLGcdIPmc
	M7PbR30P7IPssyXoG2SpDIzh5vIhqvgb9fVOwQth9HgPytOMsethGT7KVlfUvH9RxNH5P6jzcD1
	nOGJytizOGukZzHUHPUzLUDJaT/T6JSc4jPGI/+pTmKoKj6g0JrvURzQFP5aMlH1sZ2ZJx72I37
	3uxj9yVPXYD8AC1alUhyexzSkcM3M8d5bKOloFmTU4s/fR1cY4Hs0ygckXQt4ME7L0TC9srYL+K
	/2IFIbytnpgp9uRKSlHpmKnnKFZaWyHHdn7g7OXRa7Gbe8PuC+6l7xLDPMAcGrrY0YgM414shro
	N0wBJd2vKUIRNHu1y5z5WBeHw==
X-Received: by 2002:a05:600c:81c5:b0:493:bd4f:510 with SMTP id 5b1f17b1804b1-493d11f02f3mr97319415e9.19.1783330504569;
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 12/15] arm64: dts: imx8mn-var-som-symphony: add wakeup sources
Date: Mon,  6 Jul 2026 11:34:42 +0200
Message-ID: <af94dbb605a1c18f2cd2d1f86813c0c6e84eaedd.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the Symphony carrier board GPIO keys and capacitive touchscreen as
wakeup sources.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 4898018f030c..c98dca8e7889 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -40,18 +40,21 @@ key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
+			wakeup-source;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
+			wakeup-source;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
+			wakeup-source;
 		};
 	};
 
@@ -187,6 +190,7 @@ ft5x06_ts: touchscreen@38 {
 		touchscreen-size-y = <480>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
+		wakeup-source;
 	};
 
 	rtc@68 {
-- 
2.47.3

