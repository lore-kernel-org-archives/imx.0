Received: from mx-relay129-hz1.antispameurope.com (mx-relay129-hz1.antispameurope.com [94.100.132.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E74622083
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435086; cv=pass; b=Sgt00tk8CxWj7vTBV5UC1rYEpx4IryD7K+J/747dewb8zJ4RBQsRhLU9uTK1P7B+iUUU7fTdy9aHC9+iSxM0ijRwS0QCxbue/C8iU1yyvol/RSC8PmgA1ucibi6Qo9E/GCtWaoBx4wV1irDU66ZsW6Up8RAHBDe0Xke/n39j5UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435086; c=relaxed/simple;
	bh=V5JXvkgPes+hEMu1PWoguk//7xNtXcWgtFp+Z8moPEY=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=b3KgpkvW98MSX8gk0/NoDmqxGGTpLD3StJJYWc7Ltb56DUNisyFmVLaaoDZuvVE2AuX0GeDSui3kUU6Jf9NzYY+EFylWZ5GUizV9vPENWwHkQS0hallwA3qNjnPTJ4LK8hzDN6K8w3msVmjQrZzgE4Jzg0dT84TbBrXmbGtcsJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rQDwdpGp; arc=pass smtp.client-ip=94.100.132.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rQDwdpGp"
ARC-Authentication-Results: i=1; mx-gate129-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=H2vVKZ6E3yqlSTMvSj3TrmKQh+r9SzJHEpVVUrZRg/A=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771435051;
 b=mhRvLidDjjJmXZCQTkrb8mtL/S1FrSPMwLc/w6j9bsBKcP39Qoj7CkJTHXnbFlMxAL4IwV9O
 nbiAbK+JVNFiaoAneul1Y2spBFYFnJ5D3OrZopsUjK/9kO5lny3FMVzP0zT57XWwXX4sCY18c9p
 UTBAf7OMBky33oDjHp39iiV4jipcEkSxO2tJ4UhpnVaUd1vqbqUYEWbjSHsNK0qRcGK4SECCUZF
 NsuWWoDDOE5A7vscpBntTIf/nImRbgMl7L3qi9z0zw9y3mHznJYXzcW9uOZX6Jba0k8RcYN6+zE
 hM7zy62rsrWwInShCwVzK0xMIY2BGp/XuediceznVxu2A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771435051;
 b=RJra0ET1gE4tL++Cs1GWzplFXJ3WZ8mK3FH5OmzHqpKDIwrfxDavtSPuLgETfEAUZ7uUXoZA
 cEJAdgazJK2ScIUSTF8VgZIH8Y7ncCV2GEQMgzQzqHAJ6GHjq3dAv6kvJ5B5N9JkqpJ+qERsZ9M
 zvbNBN7jRue9EB5Bt9/EMeMoOCIgXiJLRb1KSloCHfxZHGzrzxRCdiVqUFUj+mHF9zo5kVKMU5V
 sWAgVnGox3DNiZ3OOYuJu1KP6KA6/7+0Gww28cVbunthkb7OriSzUc2i4UsukpCNSDP8k99FuAT
 2E3J08ZNpqBi9RahEJ5aYxdxXzAt1qv3JlADh54h5jxEQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay129-hz1.antispameurope.com;
 Wed, 18 Feb 2026 18:17:31 +0100
Received: from 10.1.31.92 (unknown [10.1.31.92])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4E951CC0CC3;
	Wed, 18 Feb 2026 18:17:19 +0100 (CET)
From: =?utf-8?q?alexander=2Efeilke=40ew=2Etq-group=2Ecom?= <alexander.feilke@ew.tq-group.com>
In-Reply-To: <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com> <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com>
Date: Wed, 18 Feb 2026 18:17:19 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Alexander Feilke" <Alexander.Feilke@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <19fdaa-6995f400-39-279b5680@147531990>
Subject: =?utf-8?q?Re=3A?= [PATCH 3/3 v2] =?utf-8?q?ARM=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_imx7-mba7=3A?= separate =?utf-8?q?BOOT=5FCFG?= circuits after 
 boot
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-cloud-security-sender:alexander.feilke@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay129-hz1.antispameurope.com with 4fGNVR4dr8z4FgGF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:2d2b41fe47441c95072726fa908a7ece
X-cloud-security:scantime:2.174
DKIM-Signature: a=rsa-sha256;
 bh=H2vVKZ6E3yqlSTMvSj3TrmKQh+r9SzJHEpVVUrZRg/A=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771435051; v=1;
 b=rQDwdpGpHRCfPblMZrW8a9YktGkdzO231GCC4UiAN3vHD5NW57sXQLgojP+A3SXsD+j70RYQ
 20Za0QvmfRPGSI+P1EhJfI7w6iRNr9xj7nxzVJ5lqMCHZUJIeh7ppev4RDPgtmG0iSoOrm/fxrV
 kMi0/QsskAWrLpm0TPx6MkkY8qFk4RHcXOLBrP06TAZBSJQkZwTjV9gaBgWIUuQWNfU+l6nZnWX
 xVFhlhAB11c1NfrEiB6Xj5SKO7Fuge7QuTevzPeiCjiZf4g0c8OdZqkNCyeVtSavEP4nM7Tgb4M
 vyzpgq5xhJbtUJMv5Wno/eTUs+kPE7lnGuAx1RQEp0/HQ==

Deassert BOOT=5FEN after boot to separate BOOT=5FCFG
circuits from LCD signals.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
V1 -> V2: Updated Commit Message

 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/d=
ts/nxp/imx/imx7-mba7.dtsi
index 03f2f2cbdfbc..4192adb27223 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -287,6 +287,15 @@ &flexcan2 {
 	status =3D "okay";
 };
=20
+&gpio4 {
+	/* Deassert BOOT=5FEN after boot to separate BOOT=5FCFG circuits from=
 LCD signals */
+	boot-en-hog {
+		gpio-hog;
+		gpios =3D <3 GPIO=5FACTIVE=5FLOW>;
+		output-low;
+	};
+};
+
 &i2c1 {
 	lm75: temperature-sensor@49 {
 		compatible =3D "national,lm75a";
--=20
2.43.0

