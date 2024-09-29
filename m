Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ABD1531D8
	for <imx@lists.linux.dev>; Sun, 29 Sep 2024 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727611638; cv=none; b=WvSA/Ta4IE/QdeTxB4B0dy1Jpl9enCYnLfYhrWCe8XG0sQEJqw3Nyj1AJlttN4i3lINzpp0tIR80aiSpf3dKrpnnzuRqpeZk5bSZAzsq2xWoTq/p5fDJulwvxf0UOI62miQPdoAMJfZVozimgaUNOSj0qAz0pKof5Wo8s0X70ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727611638; c=relaxed/simple;
	bh=Xh5ExjcgQh/E77y3Jk6URT9DRI8CIzqO6ymaMql+pt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqjUhbO8r6+7PAHswu9I7jGVKUm27oLaZU/co88y7DcO3qE8rSYMDrnz0d83YxuFKIzOToaMTNNKOpZQg81rEH3stFveeqwQbo4S/tmxbTqwpyAGe9nM75DK9ArJjhAvOtBeDMt40P31c1KYsVTv8NGJxPOQvwBhu4MFG/Hy3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=a6LPmnAO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="a6LPmnAO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b86298710so192375ad.1
        for <imx@lists.linux.dev>; Sun, 29 Sep 2024 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727611637; x=1728216437; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjxInaNhLVD836E7kvEQ4tYnrdCtxNbjV5ha2p76v8M=;
        b=a6LPmnAO/2WdJJOhXJ+tnjCq4Ip6j943BK4ssDc5YiG4fdkWtkgCS9AKZ2BM6wY/pc
         USiYPmcv8G31Y/rFvWT1k0ntEsbUTBaQRhZKl5rFtaTJ9cpFKUlnKx11q1E40FOMzGvU
         Zj/FRre6RzJfHLj1GdTJuTCxevyWhHSwY0LXFOya9l23dsh6iAr+oG7ZaEjSzE0jIKg8
         uMbRhmPbMCTgihN4LDKF3CgHN971tRbokmz7+BlHxDbQA8t+CN6GbhcQ9VrwstSL0Lrb
         s+a8LcqEt0UiWk6R2qWH6fP2g9Fxdg9i9aQ1eKZlDu1xubo20kkUmKcmXT1sAfJH2avp
         XM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727611637; x=1728216437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjxInaNhLVD836E7kvEQ4tYnrdCtxNbjV5ha2p76v8M=;
        b=MJQwi+I3hIknFKGnzDkgZxLecIdiXRripehDcTB6H9Fnm5EmeIdBCGaAdqDcKJIfky
         XaX4uQJqXyXUoylRihTczfE7ieYrKozX8NmCgpQVI+f29ilxVJA2F/WY9j4QmctqmD5U
         WRBJT+xqW5Un0qXSwvnqU7ovmd+as7UCbq9PX8Chl3awbMPmdPlcj4bIklDkvyTe4nRk
         bSZs9Aq3rCSuWfn4u5dEr9N9TXgqPrRmlqjoyROhnFFBEY/72fwbFRzhNkRgxoqKOZ5Z
         W4Zy3CBgwJHEQeoHmKrmLhgdnOaPyR7AhSexlzRNR/EMAE1mjegT2p8VWVBCy2svpl1c
         C85w==
X-Forwarded-Encrypted: i=1; AJvYcCVXS02eMcHxrs/Zl/dTS8dq1zRxSbEwz9pKlAkIb38Kx01UcdPuvDWyNQNCF3R9j5OA1DU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHQikZz8Ib8X2WLpujfs7PiU8tlJsM1fQwKHfv98gq04RVd41Z
	T7ofsbwAS96V4JpwtWAk2i7/E9x0O1IQ6YxkWEpXzgpqyjrA8IRXBO0huavz8zbNS5cgqVo6zDs
	Cgdjt+dgGwMEWBJvdu1mU5D7AJJM=
X-Google-Smtp-Source: AGHT+IGkItVurXd3ky7Ze3/m8wpVZ4KRuguynlrG29y9ctBKfpIWygc9BxUDQ0/p6z4xHmFc2bL685GfGWj5pSZ1VkI=
X-Received: by 2002:a17:902:d4c2:b0:207:13a3:a896 with SMTP id
 d9443c01a7336-20b369d605fmr122281315ad.23.1727611636800; Sun, 29 Sep 2024
 05:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240929093418.526901-1-yujiaoliang@vivo.com>
In-Reply-To: <20240929093418.526901-1-yujiaoliang@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 29 Sep 2024 14:07:05 +0200
Message-ID: <CAFBinCBYd2W8+-oKVayFmW9sEVU0Sp+vtW7QNABdsm1Rxh=Y=A@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: Fix typos in comments across various files
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-msm@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 11:52=E2=80=AFAM Yu Jiaoliang <yujiaoliang@vivo.com=
> wrote:
>
> This patch corrects several typos in comments within the mmc/host
> directory. No functional changes are introduced, only comment
> improvements for better readability.
>
> Detected using codespell.
>
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---
>  drivers/mmc/host/atmel-mci.c       | 2 +-
>  drivers/mmc/host/au1xmmc.c         | 2 +-
>  drivers/mmc/host/cavium-octeon.c   | 2 +-
>  drivers/mmc/host/dw_mmc.c          | 2 +-
>  drivers/mmc/host/meson-gx-mmc.c    | 2 +-
for meson-gx-mmc:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
