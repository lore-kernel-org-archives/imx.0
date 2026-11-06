Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793967094;
	b=IlFa3hlPxQXBlrRqcrg5FodKLm9q+F9kdYwoEp9dsUDf88BEdF/z25OKyhU27KBC6hdL
	 HsJ5HP7EXpeKbVhXD2to1KmrkPFDm7HUkoiLO46JAMW2fbix+EJdHEbI2XmfQQg0urFQJ
	 YNuzTeS/Ey0O2sefnrvkSo2vh/arRXkDq7S0Ed5PLlnIx8hpy4+OyD8GRXSjysGFx0P02
	 hGNDa8guw1DvKMfUEDCNjPa2viNAHVtrfhKJ/riahiyh2izoM1PA7eb+nUUGPuiubQuzb
	 U3EdFW6s5loOSb9aRz296QoAfDp0AKsqnA0Jl1kQyDfriX7lDbuR1pOKjJI20aAqYmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
	b=coqjY9eh36Z3AmPpRPVLKZe2gXxBcc4pvtNaYJEw5CkRghiTl5pST7k0BK75uTL7y+f3
	 9lWElMyPa0gCBVNCVjjJEtOyQCAyzyhrowjmJBscRrqxutU2loX/Xfy8oQELVeJnKWk2M
	 wWrS1K5dpZf8o6ySkIG1C+Bb4wxvER3ILMIKf8JGw+H9IvzkDTxhnhbddlmvnmQ4Y62gh
	 Swia+GWZMTS625wFY+5rgSUczf2PkiitvL+CryevbBm1EFaDZPalHQcna155PgHie/L4U
	 /06vndFT6Dx0fF2AyAEmTTmJ7qb8Fq9mRpp2JqXpWK3IjQRrgCrWhc3ZBBksTEoqhXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wq2T6mbU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD2606EE83
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 12:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60AD2606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wq2T6mbU
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so6359751fa.1
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 04:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793967092; cv=none;
        d=google.com; s=arc-20260327;
        b=FKDfo19ucUX67ksMb1WQ/6jdslDxwoEf2o506n4oUvdzsRdGu6jGUNE0+5bG+j3nVs
         wWaxNF1riyRppEjYUMAYBZkHvcjrZxJuuXxF5c0uGD8TDdk+NEH+7VZ7Mi2LPfT+8ily
         0+RVKuiqCr4nPcfItG/VRqe7PxOYlfobrChk59EZUqcCgu1+JglVZLb0YzIZDIFOGMzJ
         iDY+9qZn5AccR6XB64HSKPcHZY8KzoD9IbHlQPV6bmcusKPPt/wNFd1f9IXRsnLAtExR
         cMcQ21j+QLXzhuKw4wwqQDI7fLCf/FGaSx3TrjMu6ylMhLHREFdYEAjV7ujlwh2VToen
         b0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        fh=schAaDbvcnxkzmWf8s5XEA+0k3ad0p9Jx4qvZ2OjXcQ=;
        b=ccsHMlpQorX8xQc4rUVZd12takBv9s0sdsGn62ZXSNQ/Tph6i9GGGfjJb/KSFIPad7
         x6uxqCHKcQ9f1uT8A8RT6SA6G9wQLi9DO4Rgyza/YxIcAcIPHF+gDd8CgZGIgsC6IKWQ
         mavbB7ei+bLl0F9TXNGBomlZy6dqbqiCsPVFfw++5ZZCSuvhBw6zUnaQIr7Ir2KOn5VP
         44SNBZefLteQpXfW9PjlCxsQVmBXGnjn+W2ju1YFv8B7wQ9HlaZ61TQmoeEKonp/he+g
         N7eOZfo9eOuqlmCB5J5wO9edm8V5ixpndggN6Gn1wu2XBM/tZm0ZOQlKNDpOYdRoxYJh
         1JTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793967092; x=1794571892; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        b=wq2T6mbUIm/JUG3D6RZPHf2aAM/YZd8+KJfXDhxAn+A+lWDxvsGPetnQ1N2dIbv/3w
         ZdtcQbJi4OFRkptklvPosP/BZlsTAL+oUgg2QQfPfW+olSxZtsWd3pqyxYMjMD69RahP
         EHo4SkwM3eSIMonyp+2hjzOUxfZPxjzR4O1jeUp43v5r54Opjcfpf7EoqixSGX+fQKoE
         pHOYKpj5zYHmBIUej4XTkNiCicYo2hdsSuryU52+93ziboGL6O1gFoMAJjxpvdijFPPk
         ldBG3WTbRbHOMgM2UdAG3Xi708ot4UxUOr7Msh0IkTEpanL+GoD0t/3UQJnRgVAbs3+0
         /yjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793967092; x=1794571892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        b=0IUcGr17JY637WclTL/pzPSdA9epiZrsrmuEPIHtNHkF/VTKbRI2XqFSN1c0DZ9zRP
         WU1OA+Vd/iWZu1r8NebvR7jIZ+dz/fJGhySpuF+Ir/kaZd9WcgsF16mnctVFSJyxgyMm
         Mv/EZ9p9CDiMQ0XuNg16aGWdcLVzAYTsq64YoJ6VUS2bs5I7YtFB3XzojiVABqRwIWnr
         RTQj3uA6AtJf4lYl6ag5chEpV6b5tb2rURZAG1/Ha9g9AdIKT2hgolftU3WmJ1EKU7Mk
         T9VEzzxK2hBUbntoVHoJms1N+Y1I3MeAIKHj9+2hp0EVw+W3D6F3HaWzzvfLH7FeVx6J
         798A==
X-Forwarded-Encrypted: i=1; AKwUvBwMSrJO3Qp8FIxnyVd/nWkCv271Q9dzyuDwz2XVz8EIJBjh41hjUMRriMqeArrZCsZhUcM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8iEJm6T4uru8U2Bn4g9xshiaDY02VhdDnMoclkBTU9x5PA5Bvw
	OHGrIX8Y2aLxMd5Mryr0RfWQCCb/MElIRkEK1KUfUQm48obsPQjd1l3tnFvV33dLO29aPP0Z7PI
	8sidnpn6IRcKX5sJ+Ui0xTvo3aWW15bg=
X-Gm-Gg: AYBFou33ZWkQ40vi7yaPAj4a8xKM284NFZHxOnsx+B7DXpwgQx+F1wtUvUbwRQsT6kw
	M3gBtRPeaoKaY3qkFl7c1WPfd4fpU1gBpnq1t+vc0FOeyABzI4kfSuex2CBc92+tCkeNOTN3FsL
	oyNivCSstgBpXIZE/y+exulWpXzuqzOaOTOOKyaRyr7E/SGXeylIRz/ynfFsVWaJOiyiqgotEY2
	yz0fLIbfRpcAmg6yr3A2ZAcbpDFLqXH5qDTNzkfibsN3qQH1mOO7VXd6m1WAgrb1U09tAiCvqLo
	YLHynPtdyAwDCG7T4ssNIKT+S/7s++z1tLVxqpz9M6fhh8NIBzyCinuto2rbrsyt2awmzSQ289t
	z32wjj333wshJGJN9WKUxgE6gu+0TfIdfKs/v231Trop5KNekT0y/xpi2JkYPg4UrFCCrFSUjZv
	4EsXkkC0BleY/TfQ3rCaIS4RXEjw==
X-Received: by 2002:a05:651c:a168:b0:3ab:ac4c:186b with SMTP id
 38308e7fff4ca-3acf3a17b03mr4522841fa.9.1793967092260; Fri, 06 Nov 2026
 04:11:32 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
In-Reply-To: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 6 Nov 2026 09:11:19 -0300
X-Gm-Features: AclHuK9TdxwLahGEGzjbAfd8oBsJGMVuCCTSxGyqd0oZVKPE9N9p0AqrQOMBJUs
Message-ID: <CAOMZO5CQtcpb04Vp49Rg_+DHoozRpQthW3_YNAYQHqi=VOmpEg@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: imx6: Enable L1SS support when supports_clkreq is true
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@oss.nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 6:00=E2=80=AFAM <hongxing.zhu@oss.nxp.com> wrote:
>
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> Add support L1SS support for the i.MX6 PCIe controller when the
> `supports_clkreq` flag is set.

Please explain why this is needed.

Also, does it need a Fixes tag?
