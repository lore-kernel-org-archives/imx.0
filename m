Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975319;
	b=ZGjtFfZQm55j5fbUZCQiFkBm5evC94RAnhUe83fU45GjZ1bAXtdBtBY3k3+MZOhX0hP+
	 PSN5CQ1AXWD+jI8Taf8+g6F7VvTjBwmoSkZi3/nvE3Nbr4t8huEViZFes0NFg73+ECRoO
	 6lEBZpoRbBs15pXZu1D1TsE/KhFdICi+v/6RVb782Hvuy5T9tlADkwNbdN216V7OXphrp
	 GB0UNpuKFMblkFiQMiOPiK/1bmLVPD2B51Q1not7DVJfHbMdE2NhOp0acIRgX9ufLv7ZI
	 yx58zbsBrqMZRw73t/xbHoN/KNpOPB5Y4JMtxTQ2jhSIt1blU+4fam6J50MHOYufLHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
	b=aWRubDDUyKLzX7tVYmNhf7BilOdMnjiTv1KVTf3pAqRAUO2uOzGyajf7Xyu0w3foojJp
	 oKRcIkkMUnCqMEonfa8hZQo8lDYfk+APUU6kJGQghwgG2vom/gw7IQ2zF6FxDeHwFv1aA
	 vYmqQIsTaK0Hm6rUb493FwigG/HHCIP6UC1RIvVD2VAPy5V6GRj7j+iBkIlvfID6RG+Dx
	 4tQrCG8hGRPV3Bofbs9/SqXTM0KJ9emRNt/WRnpaJOJyEETIZxiYfk+n3/9YaDl0yT5AF
	 X2ygc5SPosDH8mZF6CpN/JR4AK07FY4YIxZCoNA50orwTER2ZT6nprA5s7AEsX2cRyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4Pjl5HS;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAE2606A31A
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 00:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAE2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4Pjl5HS
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2813745e9.0
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975317; x=1793580117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
        b=Y4Pjl5HS2a8m12qJUio892cTtOiVdmI/mAxLRJgvZt2vLfgjr6zWvB62wHcYo8vx+S
         dxwQinXZ1oH3NdEOs7uqCaW9hI/KXJ1rX9GP9F9e1H5xHT4W4KJuX/fPnlYDoTMo8Qhx
         nrUMjRs7qDPRJAq9MfdVpXpZ90Zi+oLCfdL+uArARKbKDsSyDG24imxUgSYelsBDZAqe
         O+qONodk4DqviYpcI2u6WffGin+z5aLxr1VeyGz0W4lVpLPn36hwykE2sjHilQ1pvu7e
         Rv30MvgOjzuHAUJX7104wGx/t6Y3RNnuVUsjQerh+boHCM45eyVKGw9RAWOeUK1sNT3f
         jfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975317; x=1793580117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
        b=aCpsP0ofK918BnY6cVwuDXM8BQbbzI363pFT5qwyi9iXXbq3K0ESMc0PzrxaVx8B2i
         7ByOWWry9ATY6NhGb/uLwS6xrxO+obQqSlSKBOVnM2Alb2eijtVJeO2ElspdFSsW+YVE
         rx6Zb8Ppj83F5hdko261IozvxMZ07t/TnV70OMY9PoQM4nCwtx0j+pFJJpPyXpnRYHtR
         qez/Tco7AjeMB5RGQOBm+iWBVXz7XwxPkLrGi3rKjkkep+QsYc9Bt54iBvhHL9yHRG10
         +IAfYjek2E8EVUA9RqfuY1Ki8ub9BTcTwpeF6PspWn+/Bv9UfcdKLqdOwb+qJcePCfSE
         nKlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfzzh5Gg6M84UErYu6owhXSQVFzEa+BIqAiPYXC3NM2tMb0MhA+SZ2Age/AR2Sdr1f3MA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJUFxEu+V5mE0A4hu3FShq98/6R3wMwyytXvrOJ6w/JrJSJ2v65
	IOliLFDgLzkUxEVcwhj+UvAxxVhDN2ntV7XQN17GcP7eqoYrrgW/dYHB
X-Gm-Gg: AYBFou1iWmZGzgAadiPtD8uBAA25CkGFEVHU+KLG2szG/6J1mH0j2PWeT87zKr/t3V4
	NGIGv1qcK6WgT63lE8/u5GRga7EleDvlfxnzpM61dCzZMArUTPaypHFxjsQIqZZIivam4c96MoF
	jKGEvr4wT1LgeCYTF0r1VkAmT8NFsDcv6ZUpnZPCtVn76VV8W6ry0gR4Boq5Pb1Ma3YpnmCLRWV
	TC+lbffeO6/yOKo68g0ubzSUSi/QMOE9baQ2eVURT914kLrrDueiYW5+4oYXkuastV4CvMzMF8d
	eGIaGLA4lGjOc8/8o/Fu1dHKd9SEg/Y5EniH3OJXHZztr+s0iC7tozTI+rSmLrLX2Z5jgtQarK3
	6CFsExurQU+R8SL8qisVHrGWuEs4pL5H2yC++BDkFZxkWFNWCFhABNbVdNpZ6tXz+tSE7UDBvUM
	4HzKD3LDj2Z/5ti6NAcqRd0k6TcKuip5Ou/3KKAJCpZcambcPVbkmZZJ1eJlIWBrTKNcZpNVHm9
	+QCicgZJ8mzI0Cn1MX6EAqIKYSE/0xx9ybu87uGz0nbCASvSz8LOHWXxMI26o+QPDfMUw+QFWpz
	bl5Xnn/MmpDy9g==
X-Received: by 2002:a05:600c:4688:b0:4a2:b73:d15c with SMTP id 5b1f17b1804b1-4a35ae71750mr96046025e9.3.1792975317060;
        Sun, 25 Oct 2026 17:41:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:55 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Date: Mon, 26 Oct 2026 00:39:12 +0000
Message-ID: <20261026003918.155321-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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

The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
always-on before the driver stops doing it.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index dc7ff108aa85..bd9c6c6fa117 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -154,6 +154,7 @@ sy7636: pmic@62 {
 		regulators {
 			reg_epdpmic: vcom {
 				regulator-name = "vcom";
+				regulator-always-on;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index ff9d50942884..6cf5603c0752 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -327,6 +327,7 @@ sy7636a: pmic@62 {
 		regulators {
 			reg_epdpmic: vcom {
 				regulator-name = "vcom";
+				regulator-always-on;
 				regulator-boot-on;
 			};
 		};
-- 
2.52.0

