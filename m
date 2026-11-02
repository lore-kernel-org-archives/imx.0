Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602659;
	b=JKhyCHKPlL4kWWRlEtvIzd3gfZJi0J+C1OHzFqNV6H+H4SbDiiSjc7kZMHyqoQbVT8Od
	 T1XpWh1/4vEmvY40uaLsFm1ARrArQb58pG2KY6b/NEZUVqpRJ7jv66MBl9i9cdHpRkIUJ
	 zRHqFlMvAaMeE24LV+xIyDyj+U41MfZg7l+6GW/xtgz/f0bpegpIcHYHc8zXH5hVEoyC+
	 PnNOmF9Yg8Fwe+jhbgmMWJvrIEASSXfQxpgP/hZTED0zxTpdF2IUl9Hn1+UHiAt89I3hh
	 4k9vr+KMPA19KZMByPIddh0z3PehFPoCCvDRDSJAv0Vt7pFr0rM3GKoPLKLzbXwP57A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=;
	b=mvl3QoudjVje7VHy6FdQnWPDi7RhQyRIwlhZSZGXNP605lSJSBuGW1ouRSNUN0JOMLfI
	 nHnKPLChZYF4OyShEXQopzIqcYhVEoR7jlxB17yKVZPJdpFC5OL/PnOVx6nvWrOwhpbOu
	 DNzq4aH6q0MhuEXRs7aAeP8GH2p0R3dSrVBZ/YfU68r97GHXjD2eb40h0pygkX4GmFWxy
	 xGXzKKi+3AkTt2Q4/VD8XG3weXK05NCyCiV81v1ZznQeGkyfdWHTuJN3pbTAiwCaWam23
	 2xzCrhWLAKI+5Coz790r+Z/UxdI2mDu3Jl+j0xWAADw/8eQ8lvsOCfTHOHX7x8n1RRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVuSvFVF;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EC4606A32C
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 06:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EC4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVuSvFVF
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-369f33df08eso5389823eec.0
        for <imx@lists.linux.dev>; Sun, 01 Nov 2026 22:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602658; x=1794207458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=;
        b=QVuSvFVF/7jCnSBLR33uE3PSV6Vs7QfcNjfyUGo0URGSEbaDTQM4pLcD8nM4JGHO60
         nXLniMX+dglS1yGimZMxTzhWnEtc6oXZQqVF8nx6H7MKPagNAf8LXyQrKHeMt/mueKUv
         GFnKqNfTpZUb05EZFaeBgCTp2PNhMpT6Rz3rNrsHh9UX4e/bLe+SUTvr13fKGR8QCQt7
         WNREZ7ij233Cm1SMmNh2Xz7fje7UHDXShVSUIA6eu70fx55seH+zr4O3f32hysupKjUM
         lnIpELZ+P6rfwhY1r0SJ6JVQr8+phe8kEQDhHKfumR2rBvlANCMIUyRYJRFF60K08O44
         u7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602658; x=1794207458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=;
        b=HVUN8rXcEuvELcVWCo1THkq3+mKB/x9+tS2B0G+R5SKOQk+BWufvFB7mQj03wks4f8
         4qN1La8kU61yMyQVCvVxK6felKpPA/BmDRJDw6F1R9YlxsIlO/sBH57382CuHqKeyvDz
         00uSkfugGd9ut2s2gAmV0tb2x2z6qWyQ/pGuLAOai1OwOfqhyc6lKkaG1vEorEnBU8Wm
         9NTfrkVBDxTa2SP0do6rDayNDPDZLmC6tOnlGIkSnaDzQtRBz3prEdzFRxyCvb8k5HQw
         AD7AM4TFUVXw1dnh6O8U32oF64OxsrpVWh0Kt/evKBmMTyKmRcefZWwtIhuAfxZJA63E
         RrKQ==
X-Gm-Message-State: APuU4Z+NSaw/gbpPBfStEyGoo0yHd6MqIeTdGUqPEupWieSzmea+sHgL
	094mot7m/kCPof5jQYIn9i2YkQPzfT85u46RS1xSn7hiYh7Ot0gqXbok
X-Gm-Gg: AYBFou38926f39VuJKVueaoSZlHdE2dMsx2Ow2/O/xa+SKtBhuO5AqHez1zFy9C3iiI
	XxhmlhjXYSW4WIOE2sAElIggHQKWlroaWhg6IBRx5VmuQgGlWajYYwN4k7mko6lBoQ/RtpHyqi8
	T6n4udVRlahHCoR7hN/dDqOSsrqt1T6M4wq/FqtMGq0BVM0C9eeniyFVoJMXggo+zAZCLuOVmsb
	8MiiYzIwCLoizsf7g0VXSvjUvi5jKyqKln7OgpD+S/aHfXonCxeUTvFMbBIyPLHu7M7TjZlqmKk
	wJsHaFH/nYR9dQa3ibi2biYE9ycldt5RaMStDsnX7P5gRah4r1fZq90OcGKszc+vUbnctyIXCnD
	B8Q8NgOmN0THG0fj8wrfv1EIN8nMJFjlbOxUkCh7LrN1CIDEJK5fDRJtJv9UaNMgHYcO/tKXZDw
	IXmxNHwra8yZ+eEZ6LY6Dt37ImLAwJdk458HLieVsAdSWKPHRiBkhoLvz1Wh0FEy0Z839oZr8W3
	May+GXaHyxLxYH+enMP0yAgtnR0cRTQ6D8JOXe6PvMnENTqexFI+0cPsSh4JNBUhXl03o/+2PyJ
	MIvXaUhsUKRTEKqTPy/9u3ZImfmYQ1VTBxzQCoj+Msc=
X-Received: by 2002:a05:7301:716:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36a42453282mr12431301eec.38.1793602657852;
        Sun, 01 Nov 2026 22:57:37 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm29169317eec.4.2026.11.01.22.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:57:37 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Mon,  2 Nov 2026 12:26:44 +0530
Message-Id: <20261102065645.121046-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102065645.121046-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
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

Add compatible strings for the ADLINK LEC-iMX95 module and its
I-Pi SMARC Plus carrier board.

This allows the board to be identified using the following
compatible strings:
"adlink,lec-imx95-ipi-smarc",
"adlink,lec-imx95",
"fsl,imx95".

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..1757ca4b0f44 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1636,6 +1636,12 @@ properties:
           - const: variscite,var-dart-mx95 # Variscite DART-MX95 SOM
           - const: fsl,imx95
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.25.1

