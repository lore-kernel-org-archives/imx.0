Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1FC2DEA72
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755527; cv=none; b=HqKwokGx2rC1qI+VcdLiZa0uN15LFuF6qSl/Vw2M07xPxa0zi5jrg9qbcxFJ74qhCp+s7ODbOETNuK0Slbf6FjKdkMyuyJ7hM9luUM0ciIX0jhdACUBzinx8nBFjF7m1tabuPsVn3FqWbJN9Sya9XBQO5+PXuJX8YdvUpdUVqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755527; c=relaxed/simple;
	bh=OWyCGwyyY5MwroYq5IC5e5Bk38tH2sQPpmiHCOl1mRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwsDmVUZ231/+QIMzSyu0Gr7XrGfRlk20PCA1oDMioHZKNR4jx7RD2lxtZVLu4ui03d0cUqTOWyzuSS/OUeq3IIssRGFP31EcBTNGkgOB0Kye2iN5t55MuBMNKWO0u/KFoR3jUULd9NqWLTKgSJRjIAzwvAgbSLO8BIoNFZ+iL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WW38Rn+i; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WW38Rn+i"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-11beb0a7bd6so855349c88.1
        for <imx@lists.linux.dev>; Wed, 03 Dec 2025 01:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764755524; x=1765360324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWyCGwyyY5MwroYq5IC5e5Bk38tH2sQPpmiHCOl1mRc=;
        b=WW38Rn+iSou3/5mrhItQXjXtYveXKbDi+Dzug/dlf0kmfY0vwN65eWMiKu5gdOzUYG
         a/aByZ97Avd1dK5a9ye5I8Pnn6wSAHS+7ZPsdWA9rSFN/zOSmZhCYk4HoS2vaMYFSXIn
         9fDnsMiMTPwsd0SCZi6Jielk8z1ykmr1ZMhWhcB66n9eiRqaONOPT1Kj/7xPf39kgag0
         H7rQ5edEr04opSebJE4H3TZl4BuY2MMbrEM16PSA/BKV8zrcUPijJBdpv1HYlvRDf3a7
         WAGcwbRZOmx2lh0L9AV4bQ/oZdHx43Q11nTJmaff2VpSkF2KKKTrFfGSBMPEK++wbn1D
         94cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755524; x=1765360324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWyCGwyyY5MwroYq5IC5e5Bk38tH2sQPpmiHCOl1mRc=;
        b=eP7pT6BqeShN0c1viD6jEC/4qascxkQH+3fWtIFRy++3APFYCtx6osrr0JBBVrsYOo
         ilmspygQ84ef4cwgONKwoRMVTySdjtdRcjVZ++JQCSIpHHSS6GFByAMmrUbmK2f1+win
         hqqGTUSzeZbXjKeBfhvHMwp6cBOcE5d24/Pa4M2UQjiv9a1z1AdQAWKkwPd/S2alGxOJ
         QIdG/9d1doyJM6CJJzx9o5NRrUzvJfFO6eVZfB8ppbl1jQnxQ8b84y23hyvvf6xH5Yr7
         8rSlboCnGJ3apaMjEibs4WKDKSq3L6i19aTKnXiYjR2FTLzRXzG4sbgbQADknokTCDyt
         7scg==
X-Forwarded-Encrypted: i=1; AJvYcCUQQx3fOc3g7l712l5G1Rr8WjPVma4HEKLuAFCimeL6KeZ3J8Qwc/1OXnHPJOouESzJ4O0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdC5PwOXcEov6EiqPG7/xo22Sz0c8sZEwG7IB66bOQ19lpsDCb
	wUOsu6MCDYKSmH3f9czxaojkTRnW13i25LcGe5m0a8uBm+5u7oVPUuanKi/2g9IvcHaGCL77+aP
	rIMNZkn6dVC+WAAt6JxB600NhlxMzctM=
X-Gm-Gg: ASbGncsmXTGtZO0eO0TSf86eDkzIZK/HbLKBQaEV7lwTes4LUnhLebV+WMalp7Ulwy4
	ZEqPcCppllsN859WYJuwFF3LYBsl7HvUB5vPLG3RVBwCvFeDaezET6bKR/2H7i4ZOWWeyVn4Nai
	Vya9fnhgfd52bXffh1sJfPKDCVoJ/zL3NnRlruWIObf2htNsLT5zFUuHog3J99NRAgqnrbRon/m
	h3lv4hwZ4w7k8qBwIteRZqzmqASaAJTQHgCQTDjcXiKp+xN7DReV79xXz4dkgt0dzbktNtP8Mn7
	LDi4YTlh18nhrzUZ4/XSl9LMnOlGWQ63oQTZch5jmz7/Z49WaXtULImy/bP2XPjqypx4+qGNCZC
	V5SuGRRML8A==
X-Google-Smtp-Source: AGHT+IGQ/2C4miLe3zM/NhOU3VZpHjMuVGyUXrDEher3Gr5uOwYWVn++qjicdMlG7B6aJRjD2FHdhjLCtYHpU2OLJk0=
X-Received: by 2002:a05:7022:ff47:b0:11b:9386:a382 with SMTP id
 a92af1059eb24-11df0c5d685mr1322583c88.21.1764755524533; Wed, 03 Dec 2025
 01:52:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203070605.1868821-1-chancel.liu@nxp.com> <20251203070605.1868821-2-chancel.liu@nxp.com>
In-Reply-To: <20251203070605.1868821-2-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Dec 2025 11:54:37 +0200
X-Gm-Features: AWmQ_bkG8GFRgAI4KsSzKwZsCVtdMd0KsoG-6Ph_fAU5WKTZEIqNOXxA-oOaB_g
Message-ID: <CAEnQRZDqX_-hB9mPT2s-mi99Ym_j2KVfwRykgS5W3hGJ8p_uJA@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: imx91-11x11-evk: Refine label and node
 name of WM8962
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 9:06=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Refine label with "wm8962" and node name with "codec" to follow
> devicetree specification.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
