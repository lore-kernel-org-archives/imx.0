Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320435;
	b=Ga1oPP0MqMb5bYZYIcu9SDoASDqkVu16M2VZ9EUQnYu1MtFVpHDs1o1DFGP8E5g3OIDs
	 8Vff8fGj4xMXyPj5/kG7f5tNNqGsWcAHLKbJnCsuSmvXdy4IPLkScl2pe8XvqUrJpQKSF
	 2BHdFmIKyL+E9gozswZ67SOaLAQV/DDP9J+TNV1kIYndz87JOTm5AKJdz3DuCl1gs0vtT
	 uwC9QoVe1w8crE9Guzc8sLNoZ+Po7l3NYqypBmot3izdrb81zTKlBSZl5+lWNTm9UaC9L
	 PgZy1yFIzOSgE9PDclsNdmfTKlxvt1w4VztyA63BpCQ4JWwk/JdkKQf4JmCM9iAYjNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
	b=Q/oIswevqX/3HZchVjr5Z57yQ6/j1hbaVojcrlJ8YTxfsN7F+o9CV5sOheJe/+5lhkhe
	 lOFDPu/n07haQHVza2fJRD6ESp+0js8PB4Oiw1f8OCyUnwYhTvSHj1kcviV5dnkFee0rl
	 pI0m6n+QKHnFgN1gizrSAqRCJ19kvlRvIT56qz4bSmt5mjHiGanvPbtnLjRjqK9hmWCYE
	 47rj3hD1y4yhJ6LuCLaqaCYkyxNkXHZAIvhrhHxDqui4qVend3ddblvy0QfS+/1yc5NY0
	 CRP1H/1UuXR3chdgv4lUJDiHqEzfBjuI/R6TleAWn2xV2RHz+wHp5xb7LMIiRETCJEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4MQQpab;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE7160A262A
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 14:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE7160A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4MQQpab
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b3402105b9so15556167b3.0
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 06:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320433; x=1794925233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
        b=b4MQQpabUKKdGQXLDA7uzDi1TYVdR7fE8sefQ13yq6p0bh7dx7HPIkfwpmQaMUTFXS
         /rDtPFWgWxvoPocs62TD4zVUB1wW2uDOGnViz8VG19XsSI2MtgyJJwHoSw8PKSGHGRGv
         Cb+0VJD7kwgoEp5ZefrXOQX6aG8Ttnm62fRxt4CEFH3oP1pvjNoFC+k/edFucactK1o7
         aYKle+ODlO2roaDkH9haNO5pszdEdM52n2erYqh95JEoZP/Qtmk0ZSzBel3hVfkKlE+W
         owv0WfI+KMk19hSE25eJBRiuJvdwAPMWwvX4jGeVSL5Ti+uZaPKVGY6DOs7VJHQeJZdj
         JhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320433; x=1794925233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
        b=rj8IhiGD6y+7Gl7rqU+ejxXrx5EmEmPhYK5YnYzJSnLGDaFB/ovzDz+SqlcyKxTFTk
         NJZZGwiJTuZzAGctYz8tcj4OCu7EoNUIqPRd8cEsA0L/jI3efw2HaHN4/2skuHY8Yyf/
         y85eeqJ+NUdIkmKBP3FN6oa0jbvDISbu0Dtv9PT8WRc7+tA2hi3ETj3DBqQJZdJuo7Rb
         XsOgnfXgGVEA3Le4o/nY/jL3AZwJVt+5PmGdtG9ibMRmCyJJad9iCzSP/+/8t6IG8tG/
         tJShuLqfLheOR7Z2WjaFalrUkLDcnCDcX7eKBW4fc8dSymQN4XSd0/FX80DkorpnBoFV
         mNgw==
X-Forwarded-Encrypted: i=1; AL+hErGqRbb+nZba8KOqMlwzhtBQvwQh+G0QR64e1wCyw3yNP6gXO56QSq+OjBj4Ncev4iNm3CY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+BtzAHWXSQRzmIbXTYN3szKa2EMgRN0gekEuRVlR77ToJ5l1vt
	o7JzqCWmSXJ8AB0XKd+wsTrrNQl6BWrCwGer0M4BRIWs667bu7AqtpdJ
X-Gm-Gg: AYBFou2DPEir980Ip8cxc9Z0P7kAybtUMN1SskeSil2hHUTtYw8/I/AbrhFAeGX+6B1
	REzItk8NrFH9DQ3Z398tCyYw9WSak3+DOxdIbh/4rjSp3akqhBp7rbff7Pm8l2nbzY/zmTYXsWP
	J8rfoeMitoA39LTw43q3M5TIAp8zo7MJ6Ajl8X5ec/RlFrJtzWbPg7WeauJU4iolo+8UxciT+S4
	kldFlnqFt6fnyI1xMR0FsjbKr0KF/wOmtsKwVF/5ScsY0kfDDgQoQTsZv7XynhpIadCdKFZWXN/
	8RtTnHoU7eDio5R59ZeDg+aeRWlUkyQaVoQLMNFuPDpY5cfJruCo6KRnEnCsJpOawu9hYop+Ig/
	aERnKDqt9g8eLmvBuHEMMVwlAMeqHTQR7CWmDK+yjRGtoyDhuTxfRZuY7dpTTm0M/ZSWDro+ruF
	oW9xP2Xd+zTaNMeOV1TrUkSfh0OnTEYPMqntmkXmRTte9M0lYkEVfpobVyHzyf7IEt2c2HL+UyD
	ici39BtK9YTQhTMv2xiYEEb8LyBejQ8mFQekr6CgnbwdRcv0Qxh2n5MlJ2BMxrKB8l3/X/tKVci
	Rq4NDYkQnuJVDtBDhdZMSH7NMg90lUjCphExbHXHq7cpOxMOC3UAravNgNyyh+TpiPDyELsItIj
	+M40oP3T2ee8LAw6If33iNKE=
X-Received: by 2002:a05:690c:c4e5:b0:8b0:4f12:d28a with SMTP id 00721157ae682-8b392c0b62dmr12596647b3.65.1794320432935;
        Tue, 10 Nov 2026 06:20:32 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a802:b7f6:2185:e89b:b285:6098])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a229csm1863712d50.5.2026.11.10.06.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:20:32 -0800 (PST)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Tue, 10 Nov 2026 11:19:33 -0300
Message-ID: <20261110141934.42490-1-festevam@gmail.com>
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
detection and sources 37 through 44 to channels 0 through 7. imx23.dtsi
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. imx28.dtsi also
lists these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Newly introduced.

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

