Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9C369204;
	Mon,  2 Mar 2026 19:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478668; cv=none; b=cuiOJP/afsSTMrbMH4UglfTKP93btLeb9v/MS7qVlYyZ6oqMPfuiOMtnVVwo19mJbBBhfYiGJb0ssi4RHti0WMwPleHcJkZMz48htAqkHw46ZvDP8Au8lUKMTaEhldYDRGgQArx6WEnut58MUPTv5fJgKuUbZsNaHs6avLF4tEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478668; c=relaxed/simple;
	bh=XM9t98xb89N1ZlhujZTmlv4c9tV1d43E3bTEhZWQM84=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=Ae8mpF1lA1nsrMVrnlhLRfmSlAvN9Dr164WbnMVxVLVZGA8ANMsPvO6hbcIVHR2nDLxr5ex3rq1/T6CcpxFMtBOoWX2WufwLryqcI/Uq4xRELS5NCg2BZRyBnWyWfYXpMXRe1v+19nNoYzoiJrqIh3URW55z3Wh9rC5C8/2yB7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=D4h9MOx5; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="D4h9MOx5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=RXeuyAaTvwAMCt0q3PFB8EJk7uqdNN6rk4nzvIkVw+E=; b=D4h9MOx5xJCrIvC98NK8rry24O
	ktvWnAcFNA88e2f7miLu+vTHTNhf4Xv8DYgaqIZctUKK2gLVUXuuRj/H2Z2NUwvLzYNZoz/ucndBV
	b1V7c7e3EfAdwxSQqX23gFAzlESv/zCXdqKUDZg38r7+D0UtaTnLWvRRR0S8jJmtP3i0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8fA-0007Wl-5z; Mon, 02 Mar 2026 14:10:40 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:38 -0500
Message-ID: <20260302190953.669325-3-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302190953.669325-1-hugo@hugovil.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: [PATCH 02/14] ARM: dts: imx6ul-var-som: fix warning for boolean property with a value
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

dmesg warning:

  OF: /soc/bus@2000000/ethernet@20b4000/mdio/ethernet-phy@3: Read of
      boolean property 'micrel,rmii-reference-clock-select-25-mhz' with a
      value.

Using of_property_read_bool() for non-boolean properties is deprecated and
results in a warning during runtime since commit c141ecc3cecd
("of: Warn when of_property_read_bool() is used on non-boolean properties")

micrel,rmii-reference-clock-select-25-mhz is a boolean property and should
not have a value, so remove it.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index 9ff3b374a2b31..085985356668f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -79,7 +79,7 @@ ethphy1: ethernet-phy@3 {
 			reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <100000>;
 			micrel,led-mode = <0>;
-			micrel,rmii-reference-clock-select-25-mhz = <1>;
+			micrel,rmii-reference-clock-select-25-mhz;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index 3fb5e2fb68777..30032be6fdd50 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -64,7 +64,7 @@ ethphy0: ethernet-phy@1 {
 			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <100000>;
 			micrel,led-mode = <1>;
-			micrel,rmii-reference-clock-select-25-mhz = <1>;
+			micrel,rmii-reference-clock-select-25-mhz;
 		};
 	};
 };
-- 
2.47.3

