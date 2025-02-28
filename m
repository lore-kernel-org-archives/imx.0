Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1BE1C175A
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 19:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771760; cv=none; b=o28NQqzvIq8GlJGhv7c83OaJEoTz5VCZb6Y6zMhGo/3g2LXSTDWSXcGwDevbQvf6vteIBHm1lwWuEDAgljTcfxhUNLTNvKE/aDtT32abzkcnUrc2rG1xng4Rpo7K4LBUd/Zsj6bUQHNeW2iT7ZYFhqxkraOoKzC8qpyFlDPdHxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771760; c=relaxed/simple;
	bh=ER+r8NXmdkWggNU0HA9uV61RbAhrlmzZHANxsH2Jtn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mD8AOSaZInKGhiQmAGLay9Hb98drLcKqWTnTkAdwPnbyQ7IlqtX8jgIubVLzil5eofZH+Jfe7AzNmRUSuHjnAbJwX5wCtYFUDvtAEEbmp66u+xKzLPCrw5xc7exDHVq8t2sqYTe5bXPOldoYuODQJYFYBBf3V0i784RBhc0lRM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZQ3BYx4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZQ3BYx4"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30797730cbdso23748951fa.3
        for <imx@lists.linux.dev>; Fri, 28 Feb 2025 11:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740771756; x=1741376556; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ER+r8NXmdkWggNU0HA9uV61RbAhrlmzZHANxsH2Jtn8=;
        b=UZQ3BYx47njmjVB4laC7KCXimiwaUQzRVlz5S8G+b/Dgb/yUiCEo9a/dLSdcOLricC
         ii3svTZG/pe9YwH7fcUztBcMRGkUrjj1cnmftpaFzvboTzc4TZms+KIZ1YXBV5NbJqi3
         gv1NGBrxQ7wiEuyaxPMMLAkmQzB3IaUQrmMtVbc2Wm927YDCz9V2GltLdWJR8RPTe6GR
         K/ROr24sDb9sv/zoBRx8AB72RZvU0ykSOl5/CG1r4g02xKDo3LFP/uX1l9lq11ihrFaj
         n+Frvu/B7K4bsJQ2Mb05uvOU3Vx1IJ0Q2Xwb9w+oFKNGsABuIEkG6/TlSl1L70eQ12Gu
         RDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740771756; x=1741376556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ER+r8NXmdkWggNU0HA9uV61RbAhrlmzZHANxsH2Jtn8=;
        b=bk9GuuPb92JxxnLF159HCPSPgdLyJbpFPv1sEi7QGScntdUgDL/kRiaxO1WUhGyuZW
         4U4BFjCihYnsV4dOQxdENWHt4HTT9U0Ms1C848qhkjO5ajiR1rrH5v5eQo0UzsMhUOs/
         T2eKD2pPHPC2+a/68QYNocya2RyTc4ABm9aILg9TWXUWCxC/nw5JmiY0wD8E071kLMnX
         MBX9iuXP8kX5TKPAwidCQXtnOZpfiuJ46vZt5voYSxG/FKOJBAFIVAGlStLcJBT6Vsi5
         PXGNWs2DfhY1lBBG5SbChyAy5oBtOC3pPTCkUFbh0UpskNFkPeNo/43gIQMRiKN4pvS2
         iKAw==
X-Forwarded-Encrypted: i=1; AJvYcCVVIYUVq0qwPPNYoJUAB8kRwRpIkFW5Zs1q46e9tf4ykqDArNYPhdUTfx/uB1ZUSthHKgU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa6NwJy6eoIPZodJFIt9BrzLjWCatbxVWC/ymq4wzeh8W40Dn4
	mT4dn5rHP5ROOl+qb9qEbOg5LpshWweF+WDMnvuV2koSkH9kkhvNSLkWEW/2hTjSRfG0NLRny+H
	yG9o6+o135uCoXpPipUUNVoLsG3Y=
X-Gm-Gg: ASbGncs75HMbAytqqvCZnW6j4Z1X3O8R2Q1DFhd3Ep0f8LMhEktF6x4aaaOrNcfyG1Q
	decjhvZkVodjDcId3H4STucZKdZIu6JG/LTwWH7Gr0xPTUnPbzguGmrTt2e5+MLxGwJquiF1mKY
	WPeWQjMjGZFd00Qve6uX9hrpjz8tH+zcFk9kRLQA==
X-Google-Smtp-Source: AGHT+IF0kZIiHzdFJYX2bvCwbKhMQkcQPj5hmb4BkhewRGIZt77ta8Te2nCI3MxmD7G1uvJYlftQUPlvNFyy6H3yMRA=
X-Received: by 2002:a2e:8215:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-30b93418c69mr12907051fa.30.1740771756188; Fri, 28 Feb 2025
 11:42:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com> <20250227170556.589668-2-ernest.vanhoecke@toradex.com>
In-Reply-To: <20250227170556.589668-2-ernest.vanhoecke@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Feb 2025 16:42:24 -0300
X-Gm-Features: AQ5f1JoDhtvIJKnD6zt795G88ZFNlnPp4nsAKKBjoBY0YUhUy9idNheY0yKrIcI
Message-ID: <CAOMZO5ARY0P3nNnh6tmLi1p5N0uXb8ZLqkBs3ZekXD4U_-rOww@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 2:06=E2=80=AFPM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
>
> Enable the STMPE811 touchscreen in the SOM dtsi files. The STMPE811 is
> part of the SOM. It's self contained within it, therefore, disabling it
> is not the correct default behavior.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Please run /scripts/checkpatch.pl and fix the following warning:

From:/Signed-off-by: email address mismatch: 'From: Ernest Van Hoecke
<ernestvanhoecke@gmail.com>' !=3D 'Signed-off-by: Ernest Van Hoecke
<ernest.vanhoecke@toradex.com>'
