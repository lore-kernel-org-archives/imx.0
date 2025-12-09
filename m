Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF072D979F
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277647; cv=pass; b=h5WX+ytYC6kt8YFWSgEjvx712k3NaP11hXXwJDs6LMKicwMxvsSLPhF9OozrlI1uL906Xxd/D/v1n3yPqxIttDt91iY+RO5wPiMybzZUOHjNQ/UQEl3Cdv22ONpxqXe5HqccilNJhhwRjWslqROKbbBKg0anFo5+YqB6XgCndgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277647; c=relaxed/simple;
	bh=JWzY08zZr5ApuijCOvGFjIGDX/Q9Tlkz4x79kn8m+tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poHYFssL+P4f9laNkRIo4ZQBhEej5cKpKth4yA5A5vlROXFKaUKzJ1oV7U7jnvE/FU1w0VHB7ITejFYXegokuZHYZCTVxakx1Y4Ng4JZYgVmf2zG5YfOBodUbBo8AfV1QWQW8BCYHNpwovtH5iky4NC9+M4pZKIaRI8BaT4uAhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BUFLe1eT; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BUFLe1eT"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wWWZNo1Ds8pYIpq291eVYKiaMyNft8NiKQtVzEpxS8g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277614;
 b=K3lTlxpHEbx6Rm6aA0EV2N5VTKbAzKRwv+sS9O5HrlYhzRP206/Aqxj7lrYJdmjLF3KixxYD
 Ld9I4DkWCQgg6SEkyEFhLzq9fq1dgI/gBkCoyz5DcosVWPPVKrs0p99e8KHiwwmbeAzbstxtfz0
 kGD1kYe1EsZKVuagOELEYytzozGuLRMygiO8GH+URsXqUzypUnEllJq8fRvehZ3gK9WCMRm1vyb
 7yNt0hj9lBLHwsHA3AbE3CREGpPeZvcJlAMYbtWrOehDUlWgNxa0o4ar3xdkfuDG4ax4EZuyHqJ
 zClCIA7RwoUMb+Mstmmr6/XAXegnLWr8s7cFEE/Iz6OHA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277614;
 b=iaeZwASoaeCGb4To+jV8BUv/I8w+03/BXnagLpGOWDjLPA3iJngWmsrFMAxqMQnuWjHQpFjZ
 zUZ672qj5VNiXXUOFXPDilPVu+l7TdsBU0VbXU8J92SwvtAIcaE/WWwsCRdxT/IU2bCiU+mDeVd
 QinLJcArxyVgrZ6infMzXsfaM6WlPQUNOCZ25BoT30Glk+fKEqhborbTFSnLllUzAzPRU1DcCSq
 IZU96QftrIckd0apCYNRypqguncNteP5L9ZCYSax9I/sPthVOyRe9D1uXJ04a3lhUXsB7MdW+qf
 4Ax2uUl3AkQUHqXIZ5ZFLGepXEZ9DwG7+Jd9QAL/6Gy0A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 09 Dec 2025 11:53:34 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3B805CC0CC3;
	Tue,  9 Dec 2025 11:53:24 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
Date: Tue,  9 Dec 2025 11:53:09 +0100
Message-ID: <20251209105318.977102-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dQbLD6bjYz1kNh4y
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:2d9210e846ca8202dbc6018c182c7a2b
X-cloud-security:scantime:1.911
DKIM-Signature: a=rsa-sha256;
 bh=wWWZNo1Ds8pYIpq291eVYKiaMyNft8NiKQtVzEpxS8g=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277614; v=1;
 b=BUFLe1eTSm5VYZSVGRYsJPON6K27/vjvJNhSqJNQ4gWxrDRbJLfC2c3IhoMtt3O+K4WuV0gB
 Y6agrH8BqoLxVS85AEI37E0/oDBRSDV58BmlwajmHTle4RW8ydJbySmmlc6b16DjASxUzstYxH7
 o0GUl3l8cSYIvcYxBBDUjashURalsbTn324OtTY+pcd3tgEUft/O85vOnXADQcW1fltEf8giIIG
 SWieQzEuRMamt5e4BCV0WxKf+SzgpuymVy16Ia5RCa57SyhZ7yISKjy8s3N0VgvpiYQy9Lb4n8e
 r6CI3DIUEHPs258vJP+/Psi//SknQ+YVraquNblkvJ4PQ==

As per datasheet of the HDMI protection IC the CEC_IC pin has been
configured as open-drain.

Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ff2bacf24bfd2..03b75d4cf699a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -868,7 +868,7 @@ pinctrl_hdmi: hdmigrp {
 		fsl,pins = <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000010>,
-			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000010>;
+			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000030>;
 	};
 
 	pinctrl_hoggpio2: hoggpio2grp {
-- 
2.43.0

