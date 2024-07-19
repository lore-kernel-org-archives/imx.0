Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E627C144
	for <imx@lists.linux.dev>; Fri, 19 Jul 2024 02:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721356716; cv=none; b=fAdjN4AnrN0pOXg/PHWukRf9iH9mdC/eSRn1QrpWRmPw4ZTKY9FrF38GaXUX8xDl/izTO99I7lIMDiX8xyAsyAxv6WaXz11mWscNHZ5yajeg/dph7Ykx/Az54/hqwzMn0ScMiGOkUomTzT8rJsE8j7o8UlVORAaz2rG4u9d+9DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721356716; c=relaxed/simple;
	bh=3Kcbs88XNUfMu4IbVx2fV4d6yHDWzhbGwljB013tjFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUDWZkG8TEEdFlfj5ykthBmf+lBoXoqUvY8E9OXQkIQG29Pn5me3y+vi6IT0BRPw36JLSOvIHWW2WGqRFYC9FzQj3tXlZdaSie3rP4lg06vkGzj+ixZHdwFu3RltGKL4dEr9vkOj03kvNScRZQe4VViuYx7SWE5wYBFsbQh+98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWFa7ttR; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWFa7ttR"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ee9246ab1fso3147701fa.1
        for <imx@lists.linux.dev>; Thu, 18 Jul 2024 19:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721356713; x=1721961513; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Kcbs88XNUfMu4IbVx2fV4d6yHDWzhbGwljB013tjFw=;
        b=aWFa7ttRmZM25jMzEbdLtYTeiTosjbLqUoUjAoEd2QNLgoGuGUXVivg12LREBa8HQI
         KOYqBYFB9dzDioxtw8OrnpYiXUq2lo/kQL1xh0uh7CJKC/9HHFKzTnQ+7umpAe7DV9Q+
         Ocjd4Zb3WpWXBiSz085NBAsiG3K06DfQck+N688/BOp9ukHcLQhM4doP+uwqtwnz/k3e
         goGJTVHrI39AtY94ho+4kIeTdGjmDnVrI3TwFTQ51uJYkiRZNIPJnbY+KfkZvE48ruqC
         E6Nw7xi940Gg8HIlr1YzX5rO64+egZ6f+oIeuRJGX+6fzUZGXLfwTCpdR4P8oWXW/RB2
         1z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721356713; x=1721961513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kcbs88XNUfMu4IbVx2fV4d6yHDWzhbGwljB013tjFw=;
        b=fq6N/mD/BqWsgdodfV2uxAEIq06D0/IFpIgWT11G9o6IA9EjNCJy6WR2WUijwVaehd
         /3Kp3UoVoNIr8CBe8h7q4cX3ZOnTdxrG47XCrudJKLq8mLtSQq1+y0xzWD4Zwnb4rL6M
         924eDP2YeYyyiIZzUqfmgvO5NRcWld1GF5aziFw/pLIbbmiEGFygN7HhQ2nubrUgq5UU
         a7WvxgF1JT+sz4mm8F5ADfrHYCYDw7P9kmOxgONU6B1PGaSkLwl0J+Hwz4TSwKbsKVMV
         2rWekz1m0tBWyhYevZN7MO2XU0m/REvsvg6XfG/A5idb4vBRCIRiendXrs83Eo9uuCxq
         GSPw==
X-Forwarded-Encrypted: i=1; AJvYcCW9gsddgTGSAbxaycMqdbWkoLVx3YN5C8PjxX7oU9t77QA4Wyr4cNrqsgPReT0HNW8FnJ+jdwPo4T/Wea3gFaVscz4a
X-Gm-Message-State: AOJu0YxtGbs2kmBq58LWUNCth+17TMaQeNO4umjEtTjaH/OATEoeUSL1
	HNGMYCxFMagLE5/qvciPTRKXmKIS0wz4KiqOIObXAnLXexYCzUpYqU6aDS88Y2oGLwoEc+z/vM2
	1ybl4rq7vzzzcgb4RkZhDKtEzftU=
X-Google-Smtp-Source: AGHT+IE2wlZhbA6iAfw5NokCfHidHat5n/CSmJngXm2ErFEuOXoST7YCD+2MwktW4jHrdz8gb9FE5+GnFvDmtMOYBOc=
X-Received: by 2002:a2e:2245:0:b0:2ec:4399:9bfc with SMTP id
 38308e7fff4ca-2ef0d52f62emr2709391fa.0.1721356712939; Thu, 18 Jul 2024
 19:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
In-Reply-To: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 Jul 2024 23:38:20 -0300
Message-ID: <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
Subject: Re: mx93: No cache hierachy definitions for ARM cores
To: Stefan Wahren <wahrenst@gmx.net>, Frank Li <frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 2:49=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Hi,
> today i noticed that imx93.dtsi lacks the cache definitions for the
> Cortex-A55 cores:
>
> cacheinfo: Unable to detect cache hierarchy for CPU 0
>
> Maybe someone with more insight can add this to the imx93.dtsi file.

Frank, can you help?
