Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D1538239A
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068383; cv=none; b=cEVi+aJvvLRT/RwnH6Ora9EB0JcNbLxSjr5BVN8kPPkU7pwJcsJeHxHeeeLTbS6+1MZ0C/QgfdAxZQ5mxepn10hj4UMyE3IQXFen/4nHuURBEBl3cKvJJMp+YcJKgKDrueoPqV6BJdEUeDYHEBcc1N2RDWztF8K3qgL+lWIQh7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068383; c=relaxed/simple;
	bh=61yxivWmjnMWM1viUIarU9gTufDItOGDFs0p3/V3s84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HgJ4ef1e72+GAApsPNofvyJq8ovWUdvjqqrV7ib7aekLTOBzMflpa0yzy8vw3f0KNje68TfWD3TEZEklWE3FpBe+maQGIK1OODMylqHvsUH2+3MmoUfY0MIzD8UnfFC1FhHNm6yxXgexWZ/UflubFDBaAjbZ9IDCZDk5BZU05zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vxa4m1ll; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vxa4m1ll"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so2116485e9.3
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068379; x=1783673179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiTPaztlaBR2pEeoDnHua6pbqmiqcP154lbAnOqqcM4=;
        b=Vxa4m1lleKivl6K+ab8uGdkLIbu2puHSaPnvH9h+qKafoiiNLXhu7qOPltwD55Twpr
         qPa57tYo4soKupah+ugzzg4V088aRjA+aU73C/WrR3QO8IagEPQIlqU7EkIBwM9wOGka
         b94MDcWQoU3LPshOkmG4Rji8drPt/0qW7VB0eSUY8oOTo1g0dGS2VP3uvMh8Hla3cwb/
         aLdqZ4xqaGs3u9JfqVuMeikQHhLuDEECiHJnAFv7AYNqUqE+hxG5V5Zbr/iqQGRpKmNd
         1Qstq7UwjH/v+5g1cUU0EZXErg/kWMfFMr1gr5ocmF64RTjibn2w/K5ZeLJjyjVqGTcI
         ZSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068379; x=1783673179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiTPaztlaBR2pEeoDnHua6pbqmiqcP154lbAnOqqcM4=;
        b=FQ1CFBBVAVAlKlc8mv31oPGO73skjUH7pwuu/rVq0/f0PWxzsYmrOyElqeEhNVjG20
         9ONZAfiY51RlbYC25nczDeuaY45HcTDr67fQDVC6qXGCJJoLD3yRwSNYEfsmAyX1NKzO
         DvMKPBpJy8/rPlDyXvCxtRVuzPeaNHqPr6AOurcyix/+H99WgLN0TRO1ZWSIxr9SQklV
         xplDkXjX7HI/Tms+jgQymVjPEBp4c2GSGFZaI5fUUmryeBilS2obfE8e6gvIvD6ac/cw
         Hm8PempYBR/VKJVMoE2wDrd6clT5NAZzUbRdsjhFQRr/kL2KFsegDWmPp6IX2e8juhyX
         yZAw==
X-Forwarded-Encrypted: i=1; AFNElJ9dgZHhZSCxksXyD4sK0WH2IudJWTpRiyi7SBVZFHFj7Qb/FM1HTzDgS7CSAlCi0hkfmCQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAWND/jWTQQpnLatCIEend2DYrVvEPtkXvv5/0Kllphp8aQ2e1
	Cq0NGlL2fBwjxI7iA/JrdZ1SGFxHvzOf90IEXYhpyCt5nwtdxfUk2UmP5JrWXw==
X-Gm-Gg: AfdE7cmBWYgr1IQPU1dBVvF0vGoXBvvZVl+qjZElSF5UvdXF1JPBx2s7MWZi2g9rMm0
	zlHJcAqQKlVLuhqd/+VHdMXVwytWmGJK0sAFAOGpJnEC+fVYN7TpRTYE9MCJ60wWBX/WJ3K0ajZ
	uL1eUXkD9vfgGjta+OjRWqNNU+D9Ns0PTHTTY5sHNFSK7j4Z1weMMYGwV3hfLW6IAdgobYCllpN
	C0BQYDAuyE8R9UNhum4Jc42Wcqp9N/bau4KIoqphSWhcfYd4JxFSGnMtA0k+iWoQEdHeENwCgCO
	aVPheDSzanALb3JpdhzbNbbrw70MvCmYVSjTgMieWXUaADfstGGHZHfHf65wEACQynAkvFbgjxW
	bR5bDcx6j68KRosDfuHuGRRYhKjiCs8jbsKW9Dnu9oR9amdcsdl1ora+P96HGfog32ArlKOFH2X
	mnp03GOe1wNCr2XcUbTGTQGrqi706TwL3lJopbYNUn32D/q6Bjfm3QPty51ca4lfIu6U0lCK+Ti
	rSHUhzbAqfQoJY5wKDxo66ZlQ==
X-Received: by 2002:a05:600c:5391:b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-493c3df2b42mr114145085e9.33.1783068378849;
        Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
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
Subject: [PATCH v1 10/15] arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
Date: Fri,  3 Jul 2026 10:45:57 +0200
Message-ID: <fb9bfa8584a608e9ba8179b2749593bc23c040ea.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

Add the PCA6408 GPIO expander and the ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 53130b521b5b..7d016ed5e911 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -160,6 +160,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3

