Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F07B33F5B3
	for <imx@lists.linux.dev>; Sun, 18 Oct 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326769; cv=none; b=E7+5/TJ7KeReBmueSnLvapNRS5ICYsCk4KCidu5i1TPsEcpEhT89LJawIpIH0BpwDuzKQY8PDCQPgpkJd8mfKNimobjGgMRhHQc33jxws4d/WEfHVkxGc0NG8tbr7qZPu+3aTUAAMAcQDqjfaWYotOUnGmDw5AdJK3DZrlQsifI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326769; c=relaxed/simple;
	bh=kTz07uCPd3IIAU2tuW29eA2AVOLw4tb4lfqCUC95pLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poQ9DoZKyE3GvKqVNi1wYQoL3zL2hLIqfBZypCoutuLGObdgxkK6akM4TL+IROUrnhVL50PXZSSD7jXuZhnV2fXk7N2SfPlBTlDKNV2+YLgafvYx7DtO6raOu5ADAZK0xxCtbdQq7+gMNbMySb4WN8xyKtOBudakMMJsTPD6wns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5RM62Tu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5RM62Tu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so2660565e9.1
        for <imx@lists.linux.dev>; Sun, 18 Oct 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326767; x=1792931567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=;
        b=n5RM62Tupt8ujNnplvxv9n5HcD8b1z5bFOEhyguD87uisFhZfdfl+RgpCzWiOUmyiy
         4sGrMNrsFnkvvI4uDewxdrmljMgR5Cr46rfQW1Wxid9cgNarz5uqMloOsv/uj8k1betj
         GqfvwbSsDss5VgYep+TgcxcWT3zIRXY9Is+YNBg+etkURTTOTzaA3jfHyuki3q4T8yqq
         I28f55sjCnh5v0CrY4nkwAvqggTBoz21pYUOZPBqbua6+/Jkkder79c3KhXJgUe+vOGN
         gZpMFZqzzOSTWFS3IxpiODyNncd2Z3w9dJ4AY0JZYUW0CMzEkQxVNVejY4gviaFY/dbg
         2CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326767; x=1792931567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=;
        b=MVGJNMCBWJFR9xGtN/siufwssDwBC8BQiiF9YEvgy2TL02GA3gKpWqgyHvRBmzo+tx
         lrWbDW20PFU1qak+oHDSkwZ2xTZCrHhRE7h1QiPHuW9j4gEDevibhIOsHNdp6DrpCwHS
         8HfGf34NfzFHy92UqFhaLNtsKQ0HoUE30focY8ZoK7wOaO+lnpNVmX/obkgqqD8v/QLD
         LOCpPZ3AHMQxYaen3HXNv6DeKA72EgAfq1F+eGFE0LKSEvnbsCr2n84/OhhtXNOM1WQq
         ABwy7HI5pdNUemNlKvIfIBtLFvRB20P+acJOEUzCZMY5HQlyyXiQcadgaN+5irOOP8S9
         OVNA==
X-Forwarded-Encrypted: i=1; AKwUvBwEoHDZHlcx1wVIA74D/lZzu9E3Hr8a5nIRZtghHshhx4tJ5ayITPYMpJOrJUBYAtNgbS8=@lists.linux.dev
X-Gm-Message-State: AFq9FYKPledH+Kakam+HW1vmXc2GxiJbS2pnPDOtRLJr88r7b5FzbBsv
	Y/U9oRTKCLjUG6CC4R05Incy5KRc2w3Vmh1DG9/tbELhtElZzoZshjvT
X-Gm-Gg: AYBFou122lJKAAYqqZILbxwWO1swzstBsuMuaM0FnngelRj6mvPHdutos7AvbqKlvrc
	09Lz7LVBWNwVYS2wujYRTid9gyUXhjSrInXdBOvjKq5omlYhgg8pTAK4cbg9ClS2Apu2e1qw89U
	AemA6s+xSVjI7+A/BdrjoduSCCB44XWIvqXJ2ijyFGpD9L9EFYKZfqtIBFj4GmXPiY0k8Ts4rGy
	WLSPiMKx5GJb5Tn6cmTxCmGxt3qZNKiX8DyUQPftKg46JAqKqcyVsFmKuCmHJcHeLO34UR65z3A
	gtR1zf4KHS92Wt7n2qfHTO3sHJmTlNagfTHEHRcqxglxqQQgTIWhsgTtC+k0XQBubp7/gZ9mF1J
	5vnc6fKfz7TjbMTMydFdLFSrxGtc2WJUMvLPHbCUkLxG4O6mSHGLPXbktcDsH9UwyCaTBw/DTIX
	DN9gdfF1KU0ygcErnAdOmWxgYQKenHXZs9TO/6on71GBYrGbhDdlp5UmngfJ+0cH/OtFfFMKYq8
	kHOj4sD1IITZ9dAagrjdIpTMBcF+HWx1CzWQs0qsNS/dZsiElQesC+Kzt+Bwodp7NWA8hxhZaSP
	OljCq4/zBX1SxpgcZKkrn24=
X-Received: by 2002:a05:600c:6815:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a1d762367fmr103844675e9.34.1792326766510;
        Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
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
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/4] arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:24 +0200
Message-ID: <f591f8cde74ef4b3bd0e2fcc2108b8564b195e90.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C3 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
index b30a0d8a81ba..a90a784f1966 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
@@ -89,8 +89,8 @@ &lpi2c3 {
 	pinctrl-0 = <&pinctrl_lpi2c3>;
 	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
-	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
-- 
2.47.3

