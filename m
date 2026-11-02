Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615259;
	b=Vj5DNEWOARdghqfls5GOPzmnQyYs1iwJ8NLidpqYNEFaNpQMKmJ2zUys53EjljWr8uq2
	 2q5MscYGeF47Qw6Xln6ej8jpHrMZRxzsy0QVi45WmuOjLMHeWjwhhB6oynVHhsEhX/5M0
	 6+J0E0dsmNIST/veJKLfomlp5LZ3z5d2RnDl2zsv0NMy38VI6zdxPflhi0vSjDukxDyps
	 b6iADBAttpkrCMfu0EKtnUrXYW9E2aClw1+v0HHVxBfY8Avyo2Rr+JmCvpDV/YueQVBJs
	 YjeCFwrP3jfMPRBh1am5OJiFHw64e09cgYhB2rx4YT31AuSOeQDd8um5AcpXiyO75Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=;
	b=oO7ZIN9NqKsQbjy/qR8TrYkMMaEakqh2zmWW2pCo5+lo7/Y/WWxYZ+07BTBYhO74c9Qy
	 dnibtnDx4UIByvJQ9NrKc1zDnNkFYcyCle1RqRfNxr+1Wc5vTlv7Q8keHjJaqwSkmAEnA
	 ueUlUmxEcvUWcqwzzbcBit7tDU8DXULfA71SzAE5/vPGSBMLXWM0Q9FFYyhjKhWsNlGmr
	 gqacdqWnrzVt7Xqq8UOF+BiUtIzyOWc2W/6AOCEomefogMFBT/1UL+pPp4Bee+bXhWf1n
	 YNTc0jp0YfiIrOuTXuXO7LAm2Z3TkPRWYdfMEbgjJCB4/jLD8Y51nAJdRK1hV48JrCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cEIQdwJ8;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8948F606A324
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 10:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8948F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cEIQdwJ8
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so3422682c88.1
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 02:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615259; x=1794220059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=;
        b=cEIQdwJ8RzVxnWh27wxDmneYOXaHZDq5gnOBUYRvds70zDw7U6TXIecWXGRDxO0Hjh
         G54I6p2Pw9L8eU1uRlb4D0ePSq0zPVcaFr3SVHSgpLUMspEKDBEF8GaQY6TECV0FmSuD
         cSZ17RSxkPkDf+3CcSlv2wmrVTjaMbpCz7OJ1zZxcJ4DlwirmFvsWz7NSt6zwJsKN909
         t88J4/nuxE3S12LWMCw81Bk7R+q0M8EoV0YzacPzLFu8zh5mZJquaHefzcc4B/ZOn34P
         bHmI5bbi+UV3gOtezBH7IMb8Av5+9NPqBi6vhieGotFCJG9aqYQ6s038CxukhjvhrqJk
         hY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615259; x=1794220059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=;
        b=epdSYOnt5Eua5Bf5DAwIxLwekrN1ZGouZaM2lLLlGhci42WhOd9cmRxavBZgpms289
         hrTchqkwXfKOGDyHfuBozeCmlqnSeAcOEAHvHY5jVolQiOXl24MOBRA0bzE2mMeFmqMi
         /McH92sCO1WQZba+MbYjepwlEpqNC6DWmqTukGTZBbhONFv1GeXl3G5vaIv92zW8HLCr
         0eXWHJDmUBwOCUJ2gYMHCKNznxfM4Q0VSqrk3M6jF2Dh5of85T43lWIsn8tgPHBdrDRK
         8Ol2MezFmh0c3YGP8dRNbMyilNe4Xsat2asnVYc16pButYgiswgBgZAR8MuzOFa+mfXB
         Losw==
X-Gm-Message-State: AFq9FYL3DbI/bCBcp21JpPkHg/D0+D0tTgXz9H+LPBOJO8PCa+APx13f
	EZ0gUKT2RxslxIwcwXEuFaccESd1vwnS4xbi0l4d94K7basA2zSuM333
X-Gm-Gg: AYBFou3fk0DJc9kVqE5fUUC7/0qgnUS7/qWIca1S73pc0gy8/mmjK4o0ABPewOcgu15
	wCsbnD/AoBOxk+uO5NlqBfDzi50++46BrJt3Lrzemy8o4T5RGVdMCoex4klQT/onAdI9zqF4zfD
	PG4aPuNt0mmAvD1Zl/RnZpWoIdAh+iS+i8NUEQ1z3Pb0czHWdMhiwivMos+dG9GURxyjWYNANZx
	xLfiax7TzcrqPnKd9LLfIQEVBDcRWtU7H0/LaWKQCGRdeo9zF4WYGnUPBNxurNB64pgkLINGSyu
	qaDG2YY+mVgo/X9pYQI8idO+0quiUiP1wJoHomqi6BTphb6KCqTlzyFG2g3nBAWGhHHYcrpipnC
	w8tqWw/5sfl8pSAdWLCyMVnWIMEEwgHBABB3jxQzNGq8DKSaZov0RM4S/FGqFZ9x49InHj0mWDE
	ZNeB5Bq7g0CqcoRl7nSAkXfGrSY6QAqS1iXvcjonD4u/dvUn6LKyINVQD/U7Sqft7Vc+gICMq1x
	GuQzEUPee8z8t2CzXY1SIYC9bRiGBOohQ0vmAkIA82BDCo2IFdAhGNOAT49GmLHRFj4393wCQWs
	CSF9TdsvQecUXHlYjY8WghV/zJOn507i7sWsg87Hb24=
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr16458033c88.3.1793615258433;
        Mon, 02 Nov 2026 02:27:38 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:37 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Mon,  2 Nov 2026 15:56:51 +0530
Message-Id: <20261102102653.272056-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102102653.272056-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
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

Add the ADLINK Technology Inc. vendor prefix for device tree
compatible strings used by ADLINK hardware.

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..6bbfa5619ee4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -70,6 +70,8 @@ patternProperties:
     description: ADI Engineering, Inc.
   "^admatec,.*":
     description: admatec GmbH
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^advantech,.*":
     description: Advantech Corporation
   "^aeroflexgaisler,.*":
-- 
2.25.1

