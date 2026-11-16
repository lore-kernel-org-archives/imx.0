Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869294;
	b=t+7A4TrskSDsp1CXMOj6XNFDaJBu/UYak2e/+9L2U1Rk/DEbzsn3sfaM2TLKisggFBGH
	 6E/FePdGhYX4xQYd1WMk93qlnBHiWtF+UTHZVOOQr5QyWaMl3lCGOnM0hLwCAp1DkIk7w
	 W87AyXLxK4F1FmNEP5SQt8J1IRSST3u+YCKWn0TyyAZItuxWPH5FBMhbfT/XB6p2HSvHP
	 DmkRFjJe/epJLPd5F9WQrWLKAqlospZ3M2hBaEpYfP9wFGN3G13VZe9lSqTKPJQfwx5Kd
	 fsIUSZs9NlitPSaN176JoS2jayRy8zI03p4AKIpL18wy0fKPeuSg/Jdirjm8JO0LBzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rS6peJ8v9Pm7ofa72f18HTAmcNJmQCcntGCb1eMGOG4=;
	b=bBRaRS3WSk3F9HPtKNDVy2ZJzRtQEw3ynQnRQF83asayjFKuZdyapJ48cZKQTVCwl06z
	 S4JJ1K9p3HUwCwRQZ39HaLeW6kT9ibcjueub9UMdHgoJAV0YiFnI0iVJqdl0xUeVVuCGk
	 5RanigfKdA38VNhE/4rRPj7O8qsu8rsTaJdq9TjENY7N6GSG+iCAnr83S6GjF9DH15J+l
	 3fTsS5N/co/zrb0lH3duQoqdoSZKdLwpCn/OKBm6KywORbj6GdGbBUKlAXgv/cfW7fmth
	 A9OdqvEB/90zouREH2t9FRpETnbHz+7fvqQV20CgI0JVwTZCM/7pk3Ot7idbnhbuH3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hc1rM6fo;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4D606A335
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 22:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB4D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hc1rM6fo
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b30cbfa628so32463467b3.0
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 14:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869293; x=1795474093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rS6peJ8v9Pm7ofa72f18HTAmcNJmQCcntGCb1eMGOG4=;
        b=Hc1rM6fo6R4X0NWpVKkn+lZ0hxpdEZ74V+rEmCnmfZeH9iPMp0yNLNSh+dXofcBxvb
         iL1wQRSQig3JB95xDk/4/HbjEY5EBmi3Uo1BTkU0GmpJwEwyhh69M+9B4L1Umm/c9d9v
         jVIsbh3GIT15pCF159d3dsjv1IEFmyE2PUubB02hzwLaq8lkvVV7X1eUkKu9xvOK7xSH
         y1NlqB52zDZTvI4ulUsVy8ad8UDTw0OqAoWf9JcUJTwUoZDmnIjq8u07HrsXLwJqjW5z
         EyfA/DwbazNPlbN4IZmK/NqEEtB+tfZTe5lJRa27syFPM+cLSvaQIUv39i/GlhnMs93+
         Asxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869293; x=1795474093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rS6peJ8v9Pm7ofa72f18HTAmcNJmQCcntGCb1eMGOG4=;
        b=yn/YvoJRPs6tYiuIUSTPx6MpTB1iUjTmCu7sbmtE6WV/fF1tRal1xgTU+ML6amQBop
         M4q6MoAvhgo8maiQ2cFrnwKjfA65irMhjTEdbavinKBgs2qM3/T+1PMUKkLHFiBU0cH1
         nyTZD2N7MbIX5OM6ZDq2QPHE1ZxzKIbzvC4kVP4TyVLGvcHJi/hbYLoJX2jY68bSitpv
         2PC3i4wSOV8RWv7Q2GY8ylYxiIIXbRFGGoRZx90ziaWaM6E5+Nuts9JVe55/uoZLjRMp
         njuKBi3gX9NC0HZqZF+hRK0W0qOrYQdc2jlpsD2n/H2RXO5z8EOV3SyC4iq4RFUBEn2j
         EOcA==
X-Forwarded-Encrypted: i=1; AL+hErG5wuz/g/SgJ40JL7qpPeLXwKwCeuobD/NC8k32G8E76lXqmXyxncYtHDW14mvsZ/3o89g=@lists.linux.dev
X-Gm-Message-State: APuU4Z9j9gUtxnP28BC1eYXmuXsQQkPOYg90Ezb64rbaUVw8Fjpqmx4S
	oyI6FpEiwScyZXUWgsvrk4bcySEhFFs7v6BMS5aCWAhWvi4WTDF4zF8U
X-Gm-Gg: AZFdTZdt00YIqZ0UqQzymtypuegwq+wXQPpal1o4RSqoNaKUfOSg+ZTP19VvmodBThx
	+8DlF4tgyjwDF7503taM4D7GH2NdIxppjEU/TKPhyJ5FRk6rB+3iXXz2j7SjKT4T9c8F8fPkQj1
	KMTaRdEPPTWWb6X7/EOEpjNAx1PBXNJ+qCZOdBP5gkqgRcKmKXwgBl0d4agllJOG9RxnXixM1d6
	OfoB17yPQkCUboT86Zpz7mY04YBHCT7pEmjBz7vLuY8Z2qjRJgqDQAfMzcIbRDj7gnD+6vESFvz
	Qa2JobTUD/nltdQTQy2LttBeUd7Nyj4a878Gf8jVYcRxga6+ItJMDbbE9Q412CTldL/2fnD9MLM
	ejXMmZ0vKFnPeXZPKbIey0sxnHHwILDGHz5hen6qmoE14FYeY1M7CFNdUsaaGpJDFU4g3Ocit97
	ABo2CFz9RVVm04Fq8uE9diJUzCVPEM2VmjMVJB/gMgWWTNgVlm+eErUGJw4W9wyLNRXkqaWFNSE
	e+ZBpOF9YP7Zux50KAiF5s6ow+eL679iYedmXrNuCuZZH5rwg2JSSr4QS6h3DK3MI/WLuyi8dfM
	v+DdZTJJNdKWPsPY7YeC1iwYmmof0heTvjNhPCbLj7edjpNalntm+jGOlWsOzznsBcfDPRQyZ+5
	sn26rQXETtKxrgH/vL4Qca9A=
X-Received: by 2002:a05:690e:4191:b0:677:cf4d:a932 with SMTP id 956f58d0204a3-67d896cf4b2mr5729807d50.63.1794869293001;
        Mon, 16 Nov 2026 14:48:13 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:e1c3:da60:db44:d0c8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm5259534d50.19.2026.11.16.14.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:48:12 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Mon, 16 Nov 2026 19:48:00 -0300
Message-ID: <20261116224803.61154-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The interrupt descriptions added during the conversion to YAML do not
match the ICOLL source numbers used by the existing DTS files.

For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
detection and sources 37 through 44 to channels 0 through 7. The DTS
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. The DTS also lists
these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

This change was prepared with assistance from OpenAI Codex, which was
used to compare the binding with the reference manuals, existing DTS,
and driver ordering.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v3:
- None.

 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
index 782b2f4005a0..755029880677 100644
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -87,13 +87,13 @@ then:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: channel 0
         - description: channel 1
         - description: channel 2
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
     fsl,lradc-touchscreen-wires:
@@ -102,6 +102,7 @@ else:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: threshold 0
         - description: threshold 1
         - description: channel 0
@@ -110,11 +111,10 @@ else:
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: button 0
-        - description: button 1
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
+        - description: button 0
+        - description: button 1
 
 additionalProperties: false
 
-- 
2.43.0

