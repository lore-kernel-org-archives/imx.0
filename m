Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D2299943
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 23:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557284; cv=pass; b=VSLZWrLnT9xijxp64orrYr3EccB9VGZzNiF5VicOPOwFME2Lg1fYzChSOiZBUjTv+DqggupvM0i/F9SFVV8v3T+1IC1upEw+Bbcn0fC4yG4FRnlEOBFwr/6Lr6ZhcWgDk1jEVqJiwG0gxliiSJHQduoA1DSNuIRxJrvOaKlgXRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557284; c=relaxed/simple;
	bh=7kmKAF87tQ+DKHman6EfaO9KsoR3gG9HljeNjO/MlME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjYj4J/yiW/uHCG7UanGmXjjkwNqB9TOZL+Iq9JW7E8F6fcb3YSQLgIpQiWIQpwZxAZxlo5LIDJyQ9nyBlz7gohPZwIboDilIHtdvsVicFG2aeXl87p1pSvMyAjmovXtGPpJHPyeGvfavQnC5KJn1CqrNTHXYSo1fTYRt37Zhqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpq8dCd6; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpq8dCd6"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fa66fa9dso51696141fa.0
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 15:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769557281; cv=none;
        d=google.com; s=arc-20240605;
        b=TJC52LZPCziwhIm08LPF15MUhE0CkTBmV5bcLs6NUw5R11jCz+u/eBn3RdlnE2e472
         4kD8FedfhF0H3RijC6B0rwaflGcBOYpgbsGhBcmvvfXJohWuvDididwGVZ8/wDoGREA9
         /H1mhef1wU6S5DH4szZNDtTQibcOkH5ROmoam5/qoVqxRPJJNuFdFGW8p3hEtdbmdJ3A
         5YzZQSNF21U30HYwXe+wTxUYBQr/F3pDqdcGwu0y1t7ELkew6FWK/vug5GNO9GTNld21
         E5fzKgGwCFTkToxIZOWgJ88lRVEAEJKigm9p8irGxQWsa+SX/D8emjLwyMZIesN7oNwV
         dhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kmKAF87tQ+DKHman6EfaO9KsoR3gG9HljeNjO/MlME=;
        fh=VFKoNa2inHpMWgWSUqH2Ni4aepXO8hGFyKWx/UtWNiU=;
        b=eTvpiRemgIMcoV2Ug7Db7m77U4G2Kf+7PuW4MEVfhQ7K5YLrvDxIsAq3rnwFn/FlbA
         TcDwRbbc/ZwywYcu74ujGG5lkgml36WuvR6v/VCK6L2x72LuxBW33UCdK6HEKDhiPN7C
         FkFQWNGnnbByGmiwt1UEzfk6T38cjEKDBHeov8XMEJ25pt/iNZqfEByQpdh0d7N/8wPS
         ZqZTvOFqoxeK8mPM1OogNZNZzXYZeNtfajCUAbcL9q9/+FHtjLHKztt1IUidPqTZxbrm
         0RKNSnL4wqWsOwL/qwbXCvj6+jkGktP0rnB+ReBPPMuTUhyG6Jhnpy6LCAa2f333xtZf
         qOaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769557281; x=1770162081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kmKAF87tQ+DKHman6EfaO9KsoR3gG9HljeNjO/MlME=;
        b=Hpq8dCd6luPZk3j0uAhymxC54/6C7MZp7Mpf5GtxmK6eO0kS+dC2FVcW4BQGavTdQD
         zHqrjZ0RmHKsvgRV0U7lykk8lq2VchZyTTppieDbqQPgi6xCRuLhSE7CFzifuZUfMzXS
         KD7kOAb5OUZ07ev4/fqjfHoVcftC2aH1zH7BxZsH1n4MnQwJ0YOAyVb8mnd993ENUdLQ
         hm2vj0JfPI2SZ5a0AaJUJ7L7ko2pCCfBus8oUFBYIHeocV5M0qByMmh2lvH0fgsIoT5q
         E4OUK/POYaBjcxVQNondF8kpqxrgyvyrXAJ+9hLBWwWB0BoV2SPUrv2UKPWpW9b1dULm
         S6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769557281; x=1770162081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kmKAF87tQ+DKHman6EfaO9KsoR3gG9HljeNjO/MlME=;
        b=qRbWI11SRv9XZv2QK8peoxSwGQZOdo8tmVRSRqMAjKmi25kjyE9dDHuTFmqeW1c1uz
         v1/PZWvzrSs8nzZLZZ7rNDmHCxUGwzyckSi0QI6wIJBDp0BPRyQ9/zfGYfhGdjzmo/Vh
         fVYyQudjszbJTendb6Z+xFlDHofHpirewsAryhWhfiugtPdIOvlL9ipgqPupgZlpr4vA
         P8VHUFLiaY/bRhVzHPEP27Gw2NOa0Fj74qnEoFgEdD/R+CxWKowREJxEDlKAfrjF6nsK
         G2OKlplzqnVeoOSNAo1MKyTwckG+IUPgbQ1CbzcKPxRTFtgHjU65ayr2fdANoCzIfVWP
         RxwA==
X-Forwarded-Encrypted: i=1; AJvYcCWCe0tpG3oylseFuspBiZj6AnrjIP71fv/aMqMiGDwT+QcsX207U+g0uKJ38Ri0dkFLIVU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzP/2iAU1V22LqnYMRMKZILsLFudfc0OKQBEUaHv808DtWnxe9M
	H0zQxTyIJzNE+ROnPSaQ+yUydTsNfKMxoCaIWn40gl39q8IXIZF8Erziruuf5R9jOILZX3jL56o
	olziBr7JoyA2YYspi/eWO4giO9b7mBh8=
X-Gm-Gg: AZuq6aKkCw1ygY6yiN51l769cp7WtyocyBtpfzz/tCQECm7LPR9v3J3BCi491A4Qg0s
	w34pVTwoKp3frs8/TyHDuRe8mvDkLpRn+0GJpOPx7kybKDn8h/6rHXx1vjmA9n1z7bfj1TU0A66
	9iCgGIKDUwqXw2nBNPjppRWU/9PbVL4VesIEvxKMn1CoTurLIijoI64tCf0Lzna5QYW+xaly+Ap
	aU8Bone03mvB/3s8skzCE9fS4gE5WvkX90Qm/q7MicPGbfa0qUJ8p4voIWy7FnGmKqKUqru4HOJ
	JWovluMSNYsmgRL9PxiayLkwrXA=
X-Received: by 2002:a05:6512:23a3:b0:59e:71f:cc1c with SMTP id
 2adb3069b0e04-59e071fcc42mr546862e87.1.1769557279804; Tue, 27 Jan 2026
 15:41:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
In-Reply-To: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Jan 2026 20:41:08 -0300
X-Gm-Features: AZwV_QirB8xtJhi5kl9yJ2qWiZEFsvTE9M5XNO8kGqz4pRn84DhojBOVsgWwGyE
Message-ID: <CAOMZO5A64Qy+3n7ZX2QG3FfXEwEX6KfMZaMhCi+5jFhWfBn=qw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@puri.sm, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Tue, Jan 27, 2026 at 8:28=E2=80=AFPM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> frequency is 400MHz.
>
> Fixes: 45d2c84eb3a2 ("arm64: dts: imx8mq: add GPU node")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
> Changes in v2:
> - added Fixes trailer as suggested by Fabio Estevam
> - Link to v1: https://lore.kernel.org/r/20260124-imx8mq-gpu-ahb-clock-v1-=
1-11c2e7c857b7@puri.sm

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks
