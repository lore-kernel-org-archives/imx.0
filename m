Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD54A0908
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947940; cv=none; b=QFmiJkWC8DctA843mm0zcjjqRnfDkLa4/XWtbU7q/ftQJKBD4To0Qao+Z65Z1lVLGx5q6edFJ63fSmbveE/gPw0kW5cW9X09xUr2hhi8rML03QH9pWyeHzlV4mQhkywv5Ppd1TJQg9N3Vsro9jYRf45v7yiMkU+JqQoX2BRxO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947940; c=relaxed/simple;
	bh=yI1sJ8u7HcWbY3EwhSNFIbq0rewYn6Kj2tCz78IACdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mP0V1ugoot5gUO/ZoIXj+Xl74JtaHXUKaqr+f08SsHr5jvICe77aFtU/qXI+G3x/IiRo5/84MCdm8Zg27GcougozuUDJuWVKZsTE8QeboUdPb2hnfouIA0Devgg/vIIx05SIbaPeiqV7tS4zYS2exNDZts+79Ipp9mPwsFwpsqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABOSn2w+; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABOSn2w+"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0503e39fso2017167f8f.0
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947937; x=1791552737; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hiRYKmHSzO5SlWk5Pf1admdJHvzaYFkX+u45NJi6WK0=;
        b=ABOSn2w+katFHZCUGqZOmyjJEfUnOWu+Ravh7awGinedWs1iNl2hkoUXxIbjCPXsox
         61GZscQ5SOtljHvWVq6CHUaPla/Erf3/ROkoVp4YNEtzqvn+DW3AG1GmiVStFvcINOoo
         Zo6gOe/pXWdVGjjlv+NSWlcZjhhd5qpFQ3H925VYr1fmF2ih8KWnbXT++19vlVKdOiDy
         RLBBTIffakSS59MbjgSOaV6pM+lUis9G/8+7Zcq93a8B24gVWUQodfV83veVA7yYYTO0
         DbFCZaqqdNAjr8Uayat/cJWdvspueN8nPcUOACy6Cai3E/kgsry2ewzNltmXCvJZHjCW
         CDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947937; x=1791552737;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hiRYKmHSzO5SlWk5Pf1admdJHvzaYFkX+u45NJi6WK0=;
        b=PyUG4eRyKuFoIRHzZHn0UH/eraOGz9WvipxvxRxRPlx3B1d1Pm+8Yx7herXdQC4RdZ
         pFCMKWyogpNuxOw+vHskXDamRRcm5MTScZIuuNr/0JRy4/P8NDCkLTTmp2u4OXcJgJei
         Vyd7Dckm8f5lyit3ZXBDlIwDRcIPvvxvsBcEQVFeyB52uRjJ4JoJUnshr3nBpGuxjo4n
         EKPhOA9aHIZDOfHyMnsPajHTo31+wmD96a7/NyH0GRaytwQkPcb6LHHl6sy+q8BKeTlu
         NOh6RsWmnih2j6UTKG6kZBQ7aTPqwG6SvwblFMe07Mbb0fQuQji8nhyDyxAJZx7ktKfa
         vSuA==
X-Forwarded-Encrypted: i=1; AKwUvByjQAuTQ+W07NbC6GRVFQulO26k1vKndABf02GTVUGtypI9F3jbU+UMlG9j8T92nkZ8Ax8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJspZZjk23g7dWUgU5g+IGexpvByskcXlxUzo32XW77B3HVvdtz
	hCaLhpxMuF/cK4M+6ZW97vHmJjOY3t8H7DqM+cFLOkaKAcjjHKEE4KM4
X-Gm-Gg: AYBFou2K17m9tO6bzx1B4gdNBu7aoQNdF/lfp6jDOPP267EW+e+iLpuLAhw/XRE+EYY
	ykwWsb28Yl1dq885Ee/jpW1/tG9K8KcaKzvsWQR/JoYRlzThlkuLBwpHEOHZ696ZUAwDLTpGDwU
	VeQpiiNQfb8EUPXoFi6Ffz3z6RoO3NNa/nbBR/jSvPMf5yp8rkrbEod7xq+bdHbpWObN5sXCxCz
	Wymv92sg4sUsvLKL0fypcWj8RgVrHE9APpv/1dRDHqQ0WBOH4PzPnp6Qn//eAHl0oHgtMVBHM/G
	xNl7VLGCS98ENCt2ZCuN0Lhl7EJp+Qp8+rtX6wUvb3DP4SRW4V0O7o8uCTWKRZM+W8cKFl7rzjm
	jp8ZKHjSCvuG8qz+/vBxI4iYy+CFg/H+UoNNDAzDEG5W+aN1SOD7r7YcHbq+WEnSO4awBFx58Ha
	YBEjSp94elJTzgb1fjQ8AScB8Bm4TrN5gr35Wuq86kX1VoGHKckqUpX/7Zjyt2BagrThbwiAzay
	rQiyY3ssYGEMaCHXgxqCRJymhqrhJi4d78n/DMxrXE/DRWv4nCrmvSk65cVTzAxjSZe45bKXQ0n
	sqQj5tuB
X-Received: by 2002:a05:6000:4308:b0:48a:fdde:5241 with SMTP id ffacd0b85a97d-48b12749eaamr5834965f8f.31.1790947936568;
        Fri, 02 Oct 2026 06:32:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Date: Fri, 02 Oct 2026 15:31:29 +0200
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGyv2oC/x3MMQqAMAxA0atIZgNtkSJeRRxiGzVDVRIQQby7x
 fEN/z9grMIGQ/OA8iUmx17h2wbSRvvKKLkaggvROxfw8miFNKGUuy8nJiqsZNjPMXaZgsvUQa1
 P5UXu/zxO7/sBEtjHR2kAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Add OV5640 camera overlays for the Toradex SMARC iMX8MP SoM and its
development carrier board.

This series requires support for the toradex,camera-connector binding:
https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/#t

It also requires the following patch because it relies on the on-carrier
3v3 regulator:
https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-3-f578c63fb676@toradex.com/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (2):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add camera connector nexus
      arm64: dts: freescale: imx8mp-toradex-smarc: Add OV5640 overlays

 arch/arm64/boot/dts/freescale/Makefile             | 16 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 26 ++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 ++-
 7 files changed, 230 insertions(+), 2 deletions(-)
---
base-commit: a1f0ec0d615b3287faa88cf9b8b8a125e2b6e470
change-id: 20261002-v1-smarc-imx8mp-cameras-8b664da20da4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

