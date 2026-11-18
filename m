Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005531;
	b=C9xOI2gXxetNbuqVG2CvpL7T17LvHndTggAdI/ojzizkE6AbS0TJcjbGQEiv9NjpQGnC
	 QIkDBYYR1PJV+cIm3m8YtMzVGWur8oewBYNTm/wflGmb+rtzCVOR61is4lS7f2J1Lrs45
	 h5mbnOt/EXVeEm1hF+zSYhnQXRofQhhiaAMEUpbsocZLOzS20CSHdaVlQdJuxL8GXYhhd
	 CqQiQwU1x6IENJzSs4kHcHkTkWQ7Ow4IExOALpH3sX7xccBdZoy+c798wa3SbQo+gUrki
	 hX7XhKK8HNO7Q/k4KkIBK/aqNf1WnpX7DUGeutmGlmfxOU8F+4k3X9JwVFGQlPT6e6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
	b=VwfiB+E3HE0Mhsg0U8uDH5xUUjqIo5PP5fDG04jGoknPF5rpeYE5K9vT4Jt6ckATChTZ
	 uh/oqoBFasO4cdk5XLTlWy6CueXHCbLXGxkc/feBi4OUe/Vr3Esm/b7xQPUMa9g/AuPoI
	 NOaxoG8rRQ0oPf3MMF48+7BS5E+hjddFpL4GpTWHu4XCs604V04bmTnqwKqZ9fDeERqSv
	 FJn0AQ4SZq9xsCrOoaPzVv5tS3kfOAfFYg59pJEY9TmJRobyN8fYUVJ67/8V+UBPZ1pLz
	 rWf6X69GsQNYQuXZXBcpWrRsX9uE0/I54SlaPjbw2GnwhmcgeC88dp2Kh0vrn1P/18w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re3bMHah;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85E2606A320
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 12:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re3bMHah
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso446622f8f.1
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 04:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005529; x=1795610329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=re3bMHahmQvv4gHde3IjfLYT4hGDnyQV5D/ck9UbL/9vPsVZs9yDQE0RAy7ae9UP1C
         MqIzrrhyuZINxZ2zq1Qho48y5HEMeG04Gop1FLEL5rKaUZmCV1UAtV2HUFJc9NG0QxnN
         f1CZHRaV2WZTYA/2BZqeSmciyW9hozRAb8yqMbXc/bUtpT+cOxI6UhsEZaMmRqAtLBlR
         0boBKAbul9+RPclFjtZuJXbv2Y08xBje1EAjdn9VsKxeV/yFYawZ8VvWvCzj11U6Tacd
         cFeqAaRc2c2Jd1UrYcTPaL1CbEkDuqf+Iy0jhWcKHAQhUyTjlk3od9Ucrpo25Lc5qkWc
         KyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005529; x=1795610329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=IC0ahsrY06EL6/X6Sx11dpNnZA3xGtVhIg0MJTc+VqIV/gE6wV8CNOgj6pUJC5Ir7J
         ui+P/gGzAxeFbiWV2+JMw5YhAZq1Rqrs4gaeqBn5ARFs0zjhL33OYL0GovN0KIwX1zZq
         8DgB8pJ3F+jC+6oER+Fz/rr8VUWsMmcMYwdDqdh94kKoL7i5QrBsJ48aq0DQSOvndcmq
         F0IfM99cOkDfSM3GsCsRYntxvfMxJmfZ5sOW/XOAwx+jagTVgqn8RZPRBnamjeQ2aoso
         1u9YokzFNgunS2aYC/vgIKQpwRll8YO8IGQuKEwiD68DumWPIq0Sm7l3sK2tI2JNYljo
         EIEQ==
X-Forwarded-Encrypted: i=1; AL+hErE2Bp04PLkx7pwL5D535UoClycoK87+t9etEr9FE8NUVlHRnNhBpBy6yR/OnQOaZKqvkbk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/hC9wE9QNqUAF76TdvkXdUt3SB8RiP/HorNMb1Aut9DhNsSwHI
	Qj1f2XdmSTlTqfKXvaXs2ObAd1GZLf51UpUtQkZVIHKpN6OQXsll4uBv
X-Gm-Gg: AZFdTZf5iZHoY96wB0XDs6rGI/QW3Wl2VoXtzdSSK60NMViMn4Obgi7kXRXObiLYepp
	MbMMXPea9pML4oHowvCAngARXIisze3/bw1wcryyGRXcQJ1w4SKnEpM9B5y7hHk2+0k9zjt93OI
	sar94mVk8OmD5ftnNLKdu2tEt+2sb4hMEjmGBFwPufv4kkGBedOSLmfQbbXM4DlQhglyvih3qkm
	IPL02c71cCyLsTTR6GHp9X6URmIDODn6l0z8KKWP0ICDef7S4kYzEccdBGZYjRdqI8jhzMtnip5
	TGMP82vcoSVN60MErc5JyWHp/tM8ETcWVZhfETBRMeUQyfe9fXeQ+hlS80R7P2v/8aNxJLQFDq9
	o2S1n2YRi5BRsHneAdkjqFVlf1iieYdMPjWv9jIDo0TgILGv/0IdGPgad2znHZQqKJg4byHIeXM
	eEuNWeCtv38rouSBfiJYdaX1hKJFtvp6QFRZ0flCJvnYakzbQgXM9s2U0mVH7Ta/vXbTuFWHRT3
	qJHb/mRPCspCJ6mIVCz0LrwzJFthIzxdmsWNufQHTrxe4j3zN7cSZUmiluvJtgaWHPwjY/v0VYR
	+q3JJZ0g7gQOkH7xkfeetGky4zt8Jc4WzQ==
X-Received: by 2002:a05:6000:1a85:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4a7ed957d61mr1616041f8f.22.1795005529035;
        Wed, 18 Nov 2026 04:38:49 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:370f:e244:9816:c590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2efcdsm4539201f8f.5.2026.11.18.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:38:48 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
Date: Wed, 18 Nov 2026 12:38:37 +0000
Message-ID: <20261118123837.651915-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
module reports the same PCI and QMI IDs as other WCN7850 designs, and
its board data also comes in variants for different regulatory domains
(US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
the right board data.

Describe the Wi-Fi device behind the PCIe1 root port and set
qcom,calibration-variant to the US/EU/JP board data.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Depends on the qcom,ath12k binding changes in ath-next:
- 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration variant for WCN7850")
- "dt-bindings: wireless: ath12k: Make WCN7850 supplies optional"
  https://lore.kernel.org/all/20261117174154.549590-5-ivitro@gmail.com/

Until they are merged, dtbs_check reports the missing supplies and
qcom,calibration-variant for this node.
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index a1870f7b2eca..a73d137af2c4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -621,6 +621,14 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		qcom,calibration-variant = "Silex_SX-PCEBE_US_EU_JP";
+	};
+};
+
 /* Aquila I2S_1 */
 &sai2 {
 	pinctrl-names = "default";

base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.53.0

