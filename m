Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615266;
	b=mndtHKMT1FdGX9GLp5otq/eeQBv2Z/k89LYoD3enlwIRlqudIh1FZUU7864l+psQlwKa
	 LZ4cDXd50VfKm2cizQFH+uc+4Djwxnj/zRQbsjdQNQrNvkU9iGQif8BefKxfeSRICUCtu
	 hiVOE1kyRrLiEEItmR21s0OuTiEpupftKzRrYyv4v2VTDU9yipDsJLEe/4UZkC1K88IJW
	 PsLQuAxdt1IWurysL3PsdUf250Y/1cqBITFBiZQfXDjqG6Xzuf3TSikVPGT9CQTq6YFgh
	 gtPh15gQvHMBibo1KYOlZIh/5w4E9YrkRiM0FwFF9t0FrP39YZ+SqznQLgsCXUAY3aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=;
	b=RoYMHSvyjlriMN5PGviHRJ1iOUrE9ry6dHGcxgoVDuqQuv8ORDPYRwLgSUQ/mUePezbT
	 QG8VFadez0tMYh/g/OixySLDSw0g2orv4HqHQb5We75o5vu7oPYOZTaEXHGVzblRviB4Y
	 7X/QsyUh3IOFsjXRZVxMdi9RBvQs6Dq6jZB/Z/lAyBTTWJd/xhehbvAdbS4TnEWp8QCds
	 W1qzX4eL/x3emCbkdoUcxB3lSveegyF0nSAngkxc0jAfSSCNpLyF/dyKQGS2ZCblE1evy
	 ymRxFnUr1FNfciUoq2SxL94Ct8pDwnOknCQmZ0TW3uAgf3SqRAFfzLFZFschQ+OmTEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lSfvZTgD;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC165606A326
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 10:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC165606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lSfvZTgD
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a1947498bso972200eec.1
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 02:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615265; x=1794220065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=;
        b=lSfvZTgDBnSybRQq8FTe6MA80mIwwFIEHHGDAu+uyxT8t/o/6esXektA2Eo3jxqu9a
         4s7dx1tQCPzHWC8HSxnNYGenj8J8PL6uTyT1HcseTcp//NLJybJsfPLRM6ncOuMl1gmL
         k67hr/Eox3k1tKqNU/ZgVA8zZvqkMAj8xkaETexBiPhvr21ShouCRe4LOt2hCWcAmNGV
         cF4dIfA7hUGjtNdD0EMtpCpRgDSTeRmWY1MlgqKOCitPWWcafNl4iWWpxYsgGMlI0MqS
         88eKFSRvxGgdRvOrvAh1W/VBH1aJEvixcO7h5RqI3qFOxIjeWTdnrikcSGN5vqTz5rFp
         KeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615265; x=1794220065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=;
        b=1T3W8MOzkKhEJ83A3u3J5qrvdwYslr/Ox3u/pKOeHDKavlCvqUbYrWcG2qJGRUUkEG
         xor6zj0vs+/Y92ASq05QUgTOjiHDRwOw0WFZx46UENSUNVBmnHDTUPd0cNeBKQK0+u3O
         ujrv4umWnybCVmt7TOcZWyThIxsWl+64myPcMY1+Y7wWqefIIsVTH3zwvqqzz+zvmovu
         a4BFW5oxN7S+PtO0wSmAD6hPyUfwC2gvGzVUd4eyFSoocKiQHqc46nsi4K6FuPjWdxcj
         2k20M/YQ+APlUJpWW+Re4N9zWCPpDKW/SM5FfFCCnh2kdwuWxv+73LvzV0lt1uQwfUox
         AQZg==
X-Gm-Message-State: AFq9FYJBqlQsRrKxVnWD2vsbQVQZkvsLPLkoAd20ulnTotSXiaEIEc0s
	1JbWy8X+t8VaN+L11KvaVr1VSarOHP6EVmgY6Ozh9243MQM72wzFprXJ
X-Gm-Gg: AYBFou0ostWSdxojOb33jXGrOb9f670rU9goaGwziziTO7fZac6bMmmOM0WKjYfx6Qi
	/+DkA27AICcSCkF+giTGr0kGh8Ozai+aETDbyRhwjAgzMVHRYkzoZN2Ub+B01q5dksVh0uZH1Cg
	b/K9gUH0EV8vNsJtQhCe6QqJy2F6F04ulmDq9w/4eFhHYwhP05wtWz1tVjfyjAMZC9fF+E88vBP
	HjobT8nBKlm0w/9vyRaSboC0pSLOsZqDt3vTvyMcjlCRjkxe5mAo7US98x4G3MMMotM94Gjfrvz
	s0Lj7auSjCiDzCzp6anRnXNeU2Yo+CtrvM+sD7ZQlh7Voq631+KKw0QcFMoJD0VZzRQ0xTJA/gL
	XuwDXOrxwmxuga/pmxbix3gKr8ErH0tX9/vLtdxJY3HBireJB6jOqRnBDtB/7+4C88T9koKnl63
	xgMmMzZU9mLE0T1O8SsQbsy3N6p1PIljzkDMUCLDRiuw9UjgKkh2E8C0LC4JHogW80c+Sp9B3WB
	+8lMJtWua+HjrFSE6qO3EjV3kE6CJ6fYqNOJ97+sswIg5QokJKdTTa5mCaIrICoYQ62MrmNfQDb
	bBg0uUf+rOVht8wDaIw2ilJU/D2T1ioM2EhFsbCscC8rZJcUNHdvEV2SDcgjfb2aqw==
X-Received: by 2002:a05:7022:628a:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1ac5b9cb62dmr19707765c88.15.1793615264990;
        Mon, 02 Nov 2026 02:27:44 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:44 -0800 (PST)
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
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Mon,  2 Nov 2026 15:56:52 +0530
Message-Id: <20261102102653.272056-3-dinesh.v@adlinktech.com>
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

Add compatible strings for the ADLINK LEC-iMX95 module and
its I-Pi SMARC Plus carrier board.

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..baa96b004c52 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1577,6 +1577,12 @@ properties:
               - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:
-- 
2.25.1

