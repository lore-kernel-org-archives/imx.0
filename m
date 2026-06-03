Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B5C3D47D0
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 22:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527254; cv=none; b=fHPyKQQp/xze83Ek5TE5+qLy0yTldN5dfMvd8gdA3di9a0LpyiVfEexWy77HwjpPoryoIBT4qL7VRH0VJsnFSsbOzfzIKsGqrQec0usyf8IK9yZ9VcdfQ057uI/gq3htF2ioITWSs5lAja0y69BN2XWavz4ub9X4ft8t2+xjF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527254; c=relaxed/simple;
	bh=nYAVBK9yWXmZ8FEbBC2MUhh4ZhIgYxBfZRpmyskldx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEIo9Y/ciRs0rvEPAaUHLl3KT01QCfgiM5lANIH4igqUl9GYD6s2c+17Bjn6BDNvBhwmssmwNLb3hvXcuPq8euGYovhZAPDe0yodSAga3uFbOKty8jojAUzs/2vuu0upOT/ocKqyWxCVWkzN/hFHz7rYspdqdt3vupq1UrY97Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fA/bjxkQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA/bjxkQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso604185e9.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527251; x=1781132051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLH9imkqpbpmJAh8J9v3XS6EMAgKWrtcFsXCB/DHgBQ=;
        b=fA/bjxkQOqPF7BNz0sKFu8Q364EUUh60gEOzKIBxOxp1CnLq6Y1GpE3/7mzqS1KrrH
         lXjQ+UVN2jExx2MuUkzBIsTC031ZY5lmflwvNUqGOD2pkWT7nJPLc2z4aDwv4+0cosMO
         RdPvzIj9bhOHczoajwK0iflZ40DrrnEPTS1CJY80LaDLzbiV4Pk2oPyhXWg6Qwpw0Ieg
         Pnl4WpmONa++7ZPUj10G1gNijnZQNsdYfe7PKIyIeC7ryARCgBCrzyohHotywqLDQqOY
         F8of83va4vJOr2Fw0rJSpfGoYdXH7L1sY3kZaAyUTGq9iwa1z+fTS3B2mmldU/M8DuJz
         yhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527251; x=1781132051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLH9imkqpbpmJAh8J9v3XS6EMAgKWrtcFsXCB/DHgBQ=;
        b=GYfhEZkBIC/4Hgyr4Fr0JsGXMA67KQapKZI0WqKsGFv6xWzGPHf6dTuddlx4Rk/ccs
         5QEYt7xVf3EyY5FO/J6m0jdp3c9D4qLb47Ndk08RXZyfvczRPB0nCwDxPj3OCCUyzXkN
         jYkjLgE01zf7S/L2RjopJ9ULvx0tMfYtQXG22Y2D61wUDpfr+4OqZe3aRMQyMwYyklq9
         ytKzVem4RvQB9n+EfLvw71EauGYt45o9cf8UjYuUZPw1kpcpY5VhIiPNN68F3B3IrkPT
         3EX/JrcTryJ873IEjMpwXQYo2uZoQl/FSy57o4dFqyiK8Y/VhaIXi0+jMJLWvbi0w5dt
         Mm+g==
X-Forwarded-Encrypted: i=1; AFNElJ/jyePzz21ZL/91ABSEY/I3gXOUPJF25jjog2idaJbiHVdOAeYeL5YMHgW0lOP3lzdcDy8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1gPgxFA5LxLY/d4dzCAenpeATHdXYg5bSDCmZRl2bKuSZbKPE
	YSbrNauqHdPTxT/WVQCFge5NrgzRs+5W4YkIW73OwQqFFoLOtHEU+F5Q
X-Gm-Gg: Acq92OHXqIqesoSBpaYF8Z3DsJuSotw/p8GIwcQMU104noYCCHAma9Zzg+OoCNPiWcb
	L4fY8AwvzZe+I13nVBfZgEniLdgGOS6pc+STj7lV9MQp4z2prCtCpoFUEH68ZVyNHGZZauH2VIB
	DzJC7wycbUFVGyJk2yXTjLGBtyQXZyiq8FZAwa7IW+oAU3qUJBBJv8JMhkbyNPVSShUKscPB7ZF
	BgNwnRat8t/JUU2hyaiUJqepypR/5Z6K3TPZCTIupMAPdqmsNA+RTr93mkfQ/ItV3pNtutmnQ0/
	NP3xdfdEHTm1Lsd9RVdNlLbfHl5nRHykBY2p5z9pmHh1JGZjma2LeWYHIw0nU2YIwc4TizNodMO
	nNaqDv9YXZh4y8bs6lsIOky3kFFeP5ZyiGY8Rcxhr6e3vdOvkuJdIBGg3FHP/gFyE0TTd1nd8jP
	ZTzSPp5ENd/FvNH5qBgYCMpX5riw6VfsruaZqSqsJkuKtu2axNlObc6tzhaRXgfiHhrepqu4wfm
	olbYMmzKfVxqx3NU7Okd/J+qsmemzmBDXAXUfQSv/ojsgA=
X-Received: by 2002:a05:600c:46ce:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490b5eb0aeemr79808335e9.19.1780527250987;
        Wed, 03 Jun 2026 15:54:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/2] arm64: dts: imx8mm-var-som-symphony: add wakeup sources
Date: Thu,  4 Jun 2026 00:53:59 +0200
Message-ID: <a34f166c6376ac9e0f1721ec2cf6d1477b6646f6.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780527068.git.stefano.r@variscite.com>
References: <cover.1780527068.git.stefano.r@variscite.com>
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
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 857325ef4461..090752014ee2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -55,18 +55,21 @@ key-back {
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

