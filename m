Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE3267738
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740486731; cv=none; b=ubAwmL+uXI86J8iPn0oOh6iz00VZCYaeg72gRLONob/V0kRZAwnEh5usxftWrNFnw9y530AVbtK39cnMPmL0CAAVMSt+V89Lq8OEfdbcolDGrtVwwvzucFKRtLY3X48enkkthRSfQpxNF3qblfpg9CpB2WIgKmbVLCfOp/w8rj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740486731; c=relaxed/simple;
	bh=1pyD4SZ5Q/Lc9AqUwjBxII6k9+7yhxDr5m+K9ELoDbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VE4ce1+xTag8NngqpnGBlwb1oBXwuMVT5NcgExm3r+092qJHTAOA07DCcQxc/CAX5wX/YWEDwQzmMUrOC6EcycwmtTngow3DoNpNpb7qyvPD2IlWPegPNb0DYQn6YWiciwUnMGR0oZeOvu2pvwkv4lJOP8mdM4MhXhgvHZAfiiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnXzR9Xf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnXzR9Xf"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso11002128a91.2
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740486729; x=1741091529; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hQ9PSnky3hzUHJ3r5I6w65ox232hzZUXn+oYcw3lsM=;
        b=HnXzR9XfYU39oBC7M6eENuyRF7/n+HTghISXH1N3ZsBdPGTwAHDveqD3mx5Vkd9K6S
         xgjjKItI0tUgyfbO13wqefKzEvXUCtZO89sFtyPuzTz/x/8lP1FNAQvkhzWfsm1i8D+K
         yGV0e7JwHsMA5x6l/l/HFgePc3/oTdguD6EuHd5/ZO248nPp3RnfDuUVeTCVfaTgf0bc
         CWCjPMKr+wz4OYjuQCZgJ2oWivmkHq+S4OhjccrP8bu054p01X5R6lKNL5TWnoBw8roq
         xZHBOrPewinn+sd+AyZwlxILfQXJgCzg8L5e/NJPMaGwMEubVW8HrT6qd/aw3cTjui2f
         kYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740486729; x=1741091529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hQ9PSnky3hzUHJ3r5I6w65ox232hzZUXn+oYcw3lsM=;
        b=UEzcZa+toVLwv/Z3ooC5+ddKNJYCBimoAFqL09XCE5fa39lLr53/28Y6Z+Cjp9UdOT
         lXnUGrdbMaEUa4ImklMvvzZR7yJfotEbGDsVDJ+oaobyJRi9KbBFaqsvoJ9cnUF1P61H
         1v95Cw9gM0scy++ASczM6ArhD8mATYA4H59ryDzSI62ORCotY+Mb9qZ/MfNxA8FzyXrs
         Md/De3njwZV4AjNxG8xMMA57knUjnBPkwc7+J7DcLqU42xYOzxrU4BzewDOemzjwLe2w
         Gx+E+j+ACSLrbiliABWqzcsEWbZzx1K9QGiS31lwwnXG2cQEalb3E6YYmWOoJypsrxmn
         Uxpg==
X-Forwarded-Encrypted: i=1; AJvYcCUJWSiDX2NBpVq7zNii/HtLFkUwOUMJ33H6PSFtHLLNdnfpXcA8EenmW1xBQwsgkePBzpc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8GMYa8S9odouvpl1ZonwFg5XggLhXyWW7a7i+pFXT8wHzvZJH
	cYmvf9uiMomlBsZrcNDND+kmX8xeT3ijQLH7lpSdqMX34i4wdIp70ySJaMQ5qFdHRY/2hPUwplA
	p9DwQ/32bORESpbVurbxgEMDxvKM=
X-Gm-Gg: ASbGncuTKmsKI8prZOvVefQZvRRKhLMTrO80oQpqhzeZibdTUCZjkhFpD7mf8wBi6au
	AhqJ6+vcmmsaXxA8gV87ENKZG4vvKsOCpa5ickhooRkINPp8AtmNGEU68KSZALRPoVgsQB1bAnF
	Ua8l7N
X-Google-Smtp-Source: AGHT+IEhj54F35PZEsJYYrzaWJyBanI+coj2uAU8OTJp3NVm093Jk0fuCJf+AJB+0L8a6Juozj6iHZgPqCZQO9GBPqA=
X-Received: by 2002:a17:90b:2751:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-2fe68a312b8mr6037629a91.0.1740486729075; Tue, 25 Feb 2025
 04:32:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225120707.2658709-1-m.felsch@pengutronix.de>
In-Reply-To: <20250225120707.2658709-1-m.felsch@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Feb 2025 14:33:45 +0200
X-Gm-Features: AWEUYZlyvb2cM0-5vtqGVculafUAJm4OWsTkAKrC0Tw7wQoPYmnk7k-oBG7QuOM
Message-ID: <CAEnQRZAoPxFN1ce0MEY34KpJO=SS4n33ehABH4auxWTDq8_R8g@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: imx8mn: fix micfil dmas settings
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: "robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, Sascha Hauer" <s.hauer@pengutronix.de>, kernel@pengutronix.de, aford173@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 2:12=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> The third dma cell is used for priority information not to encode
> something else. The NXP downstream kernel use the third cell to encode
> more information:
>
>  - Bit31: sw_done feature enable/disable
>  - Bit15~Bit8: selector
>  - Bit7~Bit0: priority level
>
> but this was never mainlined. Therefore drop the further information and
> just specify the priority which is 0.
>
> FTR: The sw_done feature was mainlined without making use of the
> devicetree.
>
> Fixes: cca69ef6eba5 ("arm64: dts: imx8mn: Add support for micfil")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

For all series:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Marco I couldn't find the cover letter for this series so I add my R-b tag =
here.
