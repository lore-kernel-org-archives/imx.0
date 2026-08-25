Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E14402BA9
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659873; cv=none; b=Y2mPjE8HAaHOPK+jVvKHdiLhp09EXTWYdTZG3OtL5RN8koUD4bwCmB/NNrgmSk28h6VW9+e9Oo41wVXTI8kSMHje1eE+XlFvAFwqCyZgLAn8fBXNCH2s5NA7GWtsFTkcQ9JD2MC5g+4mj/PjfMFB1KHWR/ewspE2sYjvIGHt50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659873; c=relaxed/simple;
	bh=zhIzpwZbbblTIMJbAXDH3ozg8URiRg6pzcggfvWIG4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ty1QlsoCbe1BG4cnsLla1f7fsDg2qCHIkeeG0oBpgkPTL10x6o4u3rDuhrLajQOMBjnrugSGP3S45lZQHx7v85TDr4Lmt928g5uiiE2Lf34mcq6DuJmgjzxdVRvVrsIgPkF519NPnyUlOVmuP1+ZtZRHKDcoHZrpicbqqsvUh10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ea+yXqDB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ea+yXqDB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso6273088a12.1
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659870; x=1788264670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYGTfM8APe75/Y5PRGWDLVx1kvx8Ac5mDcbwdwxZe50=;
        b=ea+yXqDBfllNl1SJlnrX5d1nUIanPt4sGgjeXVUCKhZh2gRccA4pvs+pUszi9iGhLw
         1IZ/sw2ou1XpmgV6umjUah3hGtQcYl8clmWHZlKfokh6cgmpNqDf5CR8jZfF5lFSUaCj
         8+O7Hrk4VYtPZbNCeozxMYaDiYHXlTLQ3ziwLvC5lMgE1eNDRZVBargXt5Qx/RJHZrNw
         ehbz0j6m0QNw7VCI9YekickZC+4IXKKxNEwlW5nke0FZPL+dbGB12zz3E8gc9z8WGBa2
         DR2FB0N5qF6hfVlvQ+gIDTiF/pMYqBNrroqQSOeUyAi3ALcHFU/RGyTUwH5yi1WZ+8nq
         BVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659870; x=1788264670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYGTfM8APe75/Y5PRGWDLVx1kvx8Ac5mDcbwdwxZe50=;
        b=fZvoJxwV9jd9gDUgu0p9loENU5bkxVeni8PDv4iq1b71gdIm6J4UGcbgqswkcYsGct
         HlBs2cx5+1Gd4eNVyWbwzgstAbHEg4LRhOU08jreaD6hG55tB6eQQmSi8RCch3bRVNgt
         IscVyTBjN8RPcWs44KuOcpnusQ1ewrpOmiVE0E1wQVYhxtwoURaJKDu94p0Suk3Fj0fS
         BUuTDCMFxb44y9ndk6VNG+q6NWRfz35VmAuxPu+Fe6jW4o1nIih1tbj2QinIzoOwKaul
         oqNNj2aKchDCHJqLKtaHiSsiUXrmUkGs0+d9AZuB7u3Ntjdl8gEsRjxZIFehSV5HDT46
         RARQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxZROdDauuORzpENKJmsaEtXKfhDbFs86zL1U/mCS0Uy/FICoVByaes+h0AjbnD6hhcpA=@lists.linux.dev
X-Gm-Message-State: AFuF++msypx8yAOWwSLWSzZTK+Dlzx3rHSwdZSkY0LWj2QtQeoCdltv0
	dia9RuLtcNp/xzSRHzqvDsIUK90iUnmCQpCxQdYYdb6rwt8w5+is9tJj
X-Gm-Gg: AR+sD12i98DibprcnPtLKWIHK09uNR6rh6ToO0IBEWvHrZexVscLjTVdZKjSepBORZe
	Yfx8gbCp2rmO2rVXnnSF3UrGoFLeeolx+Z4KPJUdYbdCTA9+5SD/OLnOodE6F41eF/hZV+dg8q8
	PNMPG8fLePJCjRreGYG974iLBtwNpYYfA+8gUwb+9v+3iCWwRcpQaDh/K/4bcZgsgxuHMtlrT/l
	FOLk0rnh3iQiQ1EdNhI0Dd0sQ6JkCl722wFB8aZinB9nzguT0nznT5dzum82GkrOEDkR4OYfBjf
	7I5qqVBMXBve1XLwgrgHQZaO08TWDj+A4dB6p0p/dn9QfbdjOtVkbslYHhIkZmFzyQt+BplkYgl
	XEJWkdcWTUvWZMfp3ywgkjz5eYLBVzx1WhyER3dImdNG98oAEwf5yn1LsSwRs/sq+9TjbmyKJYe
	l1KD9gGQpVB7nkmWqm6KUu4Gkzd8kTyhrkxoL3vYFWdpkQXd8UApzuLbi883s+rdk0R92Qy1ly7
	KU65WWlDp7l58A=
X-Received: by 2002:a05:6402:5d2:b0:69a:b38d:403c with SMTP id 4fb4d7f45d1cf-6a42f18f10amr41660140a12.7.1787659869893;
        Tue, 25 Aug 2026 05:11:09 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm13841351a12.15.2026.08.25.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:11:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Tue, 25 Aug 2026 05:08:11 -0700
Message-ID: <20260825120812.2152-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

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

