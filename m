Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4F484252
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843312; cv=none; b=slLBtHXVitKc2GWLlHdAgLS/bR4L0uTqwSzOf/eJK6L3lE293B1y3vopfXOqX09g/8ArV8qTFR96URv9vWINueHyXlEOFJQZO78nRs/hmn9KSjt6JQmWaHTptb4KAQZPHx/Vt/qVS1r8ysfuYRRxPwqoE1OmQ7K4bzOlPufakuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843312; c=relaxed/simple;
	bh=otjLY8M+I6ZgbZOeUnR9kBIt/DE5V0fH5Sljc8GFFI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUV+NlkQtqFregQ+esY59HOYddbbUe7rveyekY9dJBJeIl7NrNE2YkBrEWlhhTiDWGrsuCimmtK9FQHI7a9mRiTkkFYxYmt/QKISOelGNAg7jjXOkqo3CbNlTJRk+qsrfw8jojjst5u77rPs6u409sTfFiZ2nQenIwPLsKo2M+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0wzOpwD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0wzOpwD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso775373f8f.1
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 08:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843309; x=1788448109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=g0wzOpwDGSz2SJE/ZDZvzcMReX+kActHdfl/BNTOMOJdJhuMZP6UD1Xou4ZkLsjN3B
         Vgyn38ZrQg5doZxGJmgVFAJo56cS3Ll7qIWcJk3IxgPVfdMoPVgeUEH0pmj6NvIEzAjQ
         4HcI0JPrpIFOP0NotYss5/cdkoK6MkbLYxDCyW2ok8hSyF/ASzrCCmK26Jim3q06edDz
         BBU73FpJDdYHWqh5EvU+qbeDzmVEODqo1144BptWLnZsgakmRytJkem7DkVhr9w/E6G3
         7+lN6VyiWJaZRqU9eyoxnSld7Sl0WFXCN9tZkBCOy0D8/NrQjolo40BmtNv+ptwa4yEg
         imeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843309; x=1788448109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=oskIl4oXczdAz9o/iDku3Fa6X/bZp2YhjjShroCkwE/Qor20Rjz0Blq0ldldUQx/bD
         RksrUWCEds5ZxmuQYTapwcmlp1yBn9z2OYSzZOxIHRU5mrR3nmUn+8FXlDkyFjdeRSKM
         yk9Xahvfi1mVkcQ4OFzf/GFIn3uDYxCdZBhwYbIkmFqRSshAfLnJuuSZB3x8W1hKuOil
         NLkYbycUU41JhSvtno8sGPu3z4rdncL7w9W0wcdldfosdRq1vJLN9Cs7d8z8SVjaeF1V
         rXqlrSmrVI863TUsnOlixc2F0TurAtOtlAPBtkNh6UyfJF54ctMH03Xo3gA3ZwDs4L8x
         5GHg==
X-Forwarded-Encrypted: i=1; AHgh+RqOE1dpkib2BuDE/7SrMV4YObCy60X5N24+Brg7uvFezmNgSoXFs68rLJsYzmk90ckH87A=@lists.linux.dev
X-Gm-Message-State: AFuF++mBrbSoQVlX7i43J6Ych1iencMAO/CipA/71or6LCqS4UObFFLY
	hAT3v+c3+AFb0DF0V9PtsMur+ehWTQnI4AK+2cNf3wHLP6afp0tIaTlo
X-Gm-Gg: AR+sD13KeV3gSHULm5w6hy+l3asZEcAo49EP/X/7Z4RRMmDh+v6zRkhq46U54TwQJ7Z
	uQmeGzHsOyq5anPtSs0TR14jwy+2HFwLZKBldGa+RqeCij5fZLzaRB76o7dodsJ3+erb8V522J4
	0bOXrFx8BZKCWWuc2i827tOx1tOBS+/4Y15piacDRp7qM/kmuRagQ3k2PfPpTQwscP87tu8PB23
	7QdlOeXEU/UAbHUFZADNffZB1VBvXpK9B27SyZiQayoOu+kq99n+YbZ0hA9VEy/pjpzbKxtOmZm
	Z1cOOupg2sMqCz09qFRuT6vO4vjTDXPvxuHFYmdWg3pfqd4cbhX8eFDaDNVfhqvsPjQfeS3se3z
	ap9qvvJSwwY6mv9N4TC5VqVFrtR2pGoPfOCqRRfKttCyGivJgrRpTZsOIGh/YfwDmnDoHTDCBIC
	0Tg1QxIg0S8Qrqv2TIU7bhsHf+coghjEau3sYLoUc7qTwcoJlswPpFBF+ng41N/VelRsW+9n3Qz
	HbJHwIhNMPZYwI=
X-Received: by 2002:a05:6000:644:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-482eaba7f73mr9712719f8f.11.1787843309482;
        Thu, 27 Aug 2026 08:08:29 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:28 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Thu, 27 Aug 2026 08:06:56 -0700
Message-ID: <20260827150657.1657-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
References: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

