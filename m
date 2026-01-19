Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AEF3191CA
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823679; cv=none; b=KBZutHVv862v2NJ/7NQKIb91moUY67aalbpjMLsHDQCxFL1DT1HBjXH4rQsGXzDu8wowdSpCbKrWVnsGy9sZJsFPfLS0MCZlQUmMKHTzWFrCMZ4tm4GT6mmyEE6EnfT6BmLGBp9iuSJD+GVF3SQLY8yxdWOz2HSbhaKePMNUOH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823679; c=relaxed/simple;
	bh=L3MT+97S25u7D70FlA35D5k+YoREX4Gvre3dbLxk8rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THojYO9pesIGF2i+zPvIl01Z/QyI3cQvJU1QeXtUITHFZyPlXAREmx0USx7VjOGwN01bxPO5Lg4DrbkNEhE+fwa8C2NsSl52RpcoDo8GgRTP9omIS84FzPBHx3qzQeuBx6EP/YVh75YdaiBjJE+I+IQb0AomRPzFJbUo0R/I7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9eQ4B7Z; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9eQ4B7Z"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124566b6693so4345223c88.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 03:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768823677; x=1769428477; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3MT+97S25u7D70FlA35D5k+YoREX4Gvre3dbLxk8rI=;
        b=I9eQ4B7ZpYp9nkjnCsY5WXN3l2CZReeo4xCH/i41MDcNveBL8WOW049T1aIMdl6ESS
         5BJr08j78nZmDLyMdheCXD0wzKvTznmQsQYfwMcA9MEpuZN8gTzSMxI6zB0+h03MotQL
         cYMZ+YarOHCre8GScrMSeBK+bQsOnURmwoKHDP7z+mM7gek6RKCjPnVRBnzV3OBgFyAN
         Um8y5Ux7NdJjQyefwDQsaiVQ3GokBs/C51L+223/9nM93mssNe9hec+4N2dsH9hQVCed
         4Zff0xsyyMmhkjPxXHnl2vHmELZHFRWFgwdBUeVIduUfCaGiqPItq3IsDfQpeOKg8e+j
         uODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823677; x=1769428477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3MT+97S25u7D70FlA35D5k+YoREX4Gvre3dbLxk8rI=;
        b=OkzEfqfHdM3uTiTiT2Ms5nhKIeTQ+lMl5+BkDPsNWmLOE+Pm7uDUbloEeiXuUPbk/b
         friKx9wd0wukzjAYJN/GXc3z1jRWLompbOuTPVp+rteq6H5aiiE0IEWFdyBNj0w3XcEQ
         xvWPFQmPU3AhbKZqGx8veMs/M66yKMdx8EyMSuJyM9tgu0yIasoVETts3kKd2Tgbw+Ip
         lHWINmq/1imYzm5BLIU1Eqc9NRk+Sri7PrEDSlFWQquOLkK1ZhS1TfsTinNYAM9zLoGw
         m/Ld7xufDHpLUc9yRAtwfjbsvu8I+SDlSBZsIepb/Sm3lZahfm59svGpF97SpQ6JWnxt
         WfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW77/upZl02mZ1KjHsEkHkTjL8oKlssbRFZOp0UQWOL9qR822yfyzbaAKDExdY77yJ5uM8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLGEQdIQvSdq10w5kK1kntvPhwibet0gD2nuE5TmziXzvBgLfR
	1e9ZhmTUaVWLRO9cVgbBORlqtRt0H1qzEXWoXyA6+km1OX1MDBMTn96oE4NOyyBt6H8lxH73VOJ
	Y95USjCYDjcbYYEVZatZs5mpnBP7da/8=
X-Gm-Gg: AY/fxX6BPBn3AalBrNgnCsm+HukMY7r1n4TP8dJwLOUcbnegiDFTVEH3peFq52rYsPT
	+0w4NRdojIGeE8SjflH3QD/zGKDdCeU1QN3ZLU1fzcWd8ticls2gKm9DFJo54m+zqZFY8mYeQpv
	OKET2CXDB1x/dwJAdDQbqh0O+TiQ6L/zgPh5Nj6coVu6EnFyMj0IaZhRBp+OgO3/Zxx7oE7M1xy
	SkXu/oqj5Xd+7vDAk+llSOckeX6qEUXzTcRM8C7EaFQ6jJK6PhINfz0LMeni2n1C42RyKOsQK6i
	bOI8RDl2GAhlnfnjkvQERADzl4u8zCHwRcYOHA1O1l3YoQ6hGKOZS3b63sgx7lvNGx90g5TkszX
	YMVkcCl9LOA==
X-Received: by 2002:a05:7022:2526:b0:11b:9386:a3c1 with SMTP id
 a92af1059eb24-1244b395eecmr9065273c88.44.1768823677453; Mon, 19 Jan 2026
 03:54:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119103654.51318-1-francesco@dolcini.it>
In-Reply-To: <20260119103654.51318-1-francesco@dolcini.it>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 13:57:17 +0200
X-Gm-Features: AZwV_Qjn-law-_KhQdrPSaRXm2pJ9JQh-dHRP72Qm7kKPCJK_LWk9DtifbbNfZI
Message-ID: <CAEnQRZAk5awoJdkAaSEdcopkmT1g1pdJLz76DdqkQ_p5pqT73Q@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Remove obsolete TODO comment
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 12:37=E2=80=AFPM Francesco Dolcini <francesco@dolci=
ni.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> The GPU is supported since Linux v6.9, with changes in the SoC dtsi
> file. Remove the related obsolete TODO comment.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
