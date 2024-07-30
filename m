Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25FD529
	for <imx@lists.linux.dev>; Tue, 30 Jul 2024 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722349496; cv=none; b=K3bAj200T5Ld6b8lJ7BdYZCaugdCyvRcCnoTcL5AIrtDaDJA4hfxHtcsCPPeEbX04fhqirSJon5l4IahPxFi8evY477gv+CkclMmUez2KTob7GGf+GsgRICH7mmv5rkAYU6bcgJCEGULpEI/rv1kvTY4kihdYveaswTesPrYnrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722349496; c=relaxed/simple;
	bh=a3Twj+tKrTN1LJBPahVQGDrXsQIIywZnRr9DiZA9QFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHVN1Loc0xU6/6Rpt43JsZk9WN2CL/ZOCOOtB+b9OEiLnOx+XHs+Jg1fqm8LruBnbMFO0WFLP5lJWVd0bnX3HG0kd7ol0YULAxma4phtDz/LhbdN38V3rKi/rTk5Lux5uKSdVenJvk+QFASzJzurEMeL26Ok+VWZBe9YI4EEQC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7n+BkFT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7n+BkFT"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efa98b11eso850597e87.2
        for <imx@lists.linux.dev>; Tue, 30 Jul 2024 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722349493; x=1722954293; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xI0EvaYxG+d4Jl2I65XudDL3wvLLwF4ro74qjIQZXeU=;
        b=m7n+BkFTI2v48SwQsaohCGkAka48nt6AEbuq7lqs4hP6dehgC47ZhNjEXZQpjrT0lQ
         wTqLcjt+DyJeeqCjoRchXGriTck2Bnk0+YfsiIJns7hhA3ZOWtEo7JYdXdi+hpoXi6JH
         DYzCbyPcIBXTXbeXRmcMcfgQs2cJp8kXEDsAsWQreZLbt7fYV4+pHAN4pekPYHFdzGwG
         NSIqu9JXeI7ZIF/7Y4BiHqORbJHtR5+bxsByOnas6i5KaHOhGaluL8oX2Kfl3C0qQ5m+
         a8iYzZ9eJxvYU+QlweyL8KbUhvyYySw0T+6NjdCs58L4jDTRCcNrHcyzONEhiKXo74Ce
         7yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722349493; x=1722954293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xI0EvaYxG+d4Jl2I65XudDL3wvLLwF4ro74qjIQZXeU=;
        b=LftWSNY7bEJIHFGCtjBjo15OxYQMBueohw+uz4NZaM+ED0Jyr5PDljoJrp2Rb9Hebo
         LSKhk3Hf5Pk6F/j1ivDLqKKj9n0o+VZot2c1sdWp4ZZESe5/XoRiK2J/Y+c8oTmzcK+1
         0kbsx9Oaexn0bhQQILW5ZPn9SM/TEy5NTwXSB/Gb83m1Kv4IZoi96IihREqeUqisP0Bm
         XOq4wqB71YMgAWsCjPfETtWTIGW3tui4gb5e5SfwuEvk1ZJZdI71iCgaP8ex1jDUhWSe
         tQ6epQqGHGMe0k6w7SayXfpUlxrwxWjgoFEWD9qKa6TQI/Zevp+ZzP5YjwH1scYAeaaK
         ChYA==
X-Forwarded-Encrypted: i=1; AJvYcCUdYaZpewaVvhLXcDL3xAlfHIT42Sbxv1vkCGGLvo2hH5AyF5Tnnxgh2NzIzheS12QsPw4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqmzFl+exX4SOXxuzMNOCN8g1a/KFoZdjGNSPEnPyVNzRrmQVt
	YMLGxYeLcQu+EVYFIp5ICpQwS/vr2Ye13fDN3r47Aar1eXHofkVowVkipgJHSCekTof6EGHrBeR
	IZR7WT+TtCRdtPr+rhY3xljUjJ2E=
X-Google-Smtp-Source: AGHT+IGucEaqYkfcAVwIGhs+1afFiARN9Mts69V5eAmQIlo/GZTQ0VSTgfEO4j6H+7DBfLUB96Y5VVDdxavzl15My5k=
X-Received: by 2002:a05:6512:68b:b0:52e:ccf4:c222 with SMTP id
 2adb3069b0e04-52fd5351eb0mr6043791e87.9.1722349492174; Tue, 30 Jul 2024
 07:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240729193527.376077-1-shenwei.wang@nxp.com> <Zqi9oRGbTGDUfjhi@LQ3V64L9R2>
In-Reply-To: <Zqi9oRGbTGDUfjhi@LQ3V64L9R2>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Jul 2024 11:24:40 -0300
Message-ID: <CAOMZO5A7BcFpMFQ_4wtQ5s8cVpUhCKMXScKkYvhq9gkrCQ3uEQ@mail.gmail.com>
Subject: Re: [PATCH v2 net-next resent] net: fec: Enable SOC specific rx-usecs
 coalescence default setting
To: Joe Damato <jdamato@fastly.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-imx@nxp.com
Cc: Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 7:17=E2=80=AFAM Joe Damato <jdamato@fastly.com> wro=
te:

> I'm not sure this short paragraph addresses Andrew's comment:
>
>   Have you benchmarked CPU usage with this patch, for a range of traffic
>   bandwidths and burst patterns. How does it differ?
>
> Maybe you could provide more details of the iperf tests you ran? It
> seems odd that CPU usage is unchanged.
>
> If the system is more reactive (due to lower coalesce settings and
> IRQs firing more often), you'd expect CPU usage to increase,
> wouldn't you?

[Added Andrew on Cc]

Shenwei,

If someone comments on a previous version of the path,
it is good practice to copy the person on subsequent versions.
