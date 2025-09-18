Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F42DA760
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 06:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758177709; cv=none; b=osp0T0SNp9IGuszoYKwEgn92Nyj/Ew4222qlsP/Ydc39JJs/DAd6fMxTiQBQ7Nqmv8ifByE/l80wbYqeiIbyxSdO/hLLMPApdIEdUi04+j7mTmy5Rb4tCdOCVEUexvINLGNvgHvAHQ08EBC9+qFmF+0OgupBGVzuTAU6dN7NLfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758177709; c=relaxed/simple;
	bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Djd9jphvOJs/i1XK66NWT0QQStlVpR/rt49nGfX9T+dOB4mL3iR75HGQyK+xDitDsNejfJ2M7gGeBe54t+xTGUGpEOEvEmLEXPHPo2oK5gZT61THsQiZ7oIYSDs1XvBhq/kcV4RPU+qKbs+YV4TDWKH6WFjEgAt94gDu6106whw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBtdvyv+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBtdvyv+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24457f581aeso5781365ad.0
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 23:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758177706; x=1758782506; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=;
        b=dBtdvyv+i3WHitIkreVzHCG5QJbM1TaJKslS9zSGwp6q8MXUDKcdrTMU/7/u8FikqK
         yfCEmW9+sfm+w2hzndmpUWEtnJ6U8D3maOdCjAJ2Oi9LfUofwVLkTEsbfWZK6ym/nov0
         fCCMHe1YfguXqtAty8jUfryw7qpfNp65RjaxNSo6w/2zOEBvJAkvKOQsGDy9EHoo8iIQ
         VJyneHjzff6YD7LUTUQZ8+R+GKFjRdVmjsNaMcPW+rJrVDPDEfktP01bFf+Nb4TM4d5+
         2UmLDGignUufDhI0HRFkfuoM5QD4n1y9Xk/E+Tb+AjSYQgr1DokGOPpTkYKeLqJMYRko
         8Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177706; x=1758782506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=;
        b=r4GBAG6Yk9v5GMERBh2arJJZb0Y5+Gvw+moUT6uIHq+Tsrhxw/T9LzYX9d/AZ1doHV
         J1IApLVgjf3KcSuP4dPLAiOR//kv0JBMbedtjgtBfspVGrgYgFJdnbQeFLJqkC+rR1s3
         OIBRpbfNt+0KccFg6TEjHPFuA7QLyGQCSlPCDHP7NBZVnD8pd9e/FYmGOtVFuXQ2lLeD
         YXLttvQzxQHss8ymVQuGVYr23BHQTmguLdGX+v+e7x4UWfrq4flR2guVPtpDaGzXUxk6
         bgsZi//PkniGh1oXcjsx+ENkGj4BbrMH9kb0wuN8ff8Jur6FFD7Q27xokrfN8JFiXcTH
         zWhw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ1GsZiFVx9HVabYeDu/ctPL0ibEBr0NnJNVnKmwy7G9X4wXd0jFFs5gRDQ7W10A5Dbx0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxbqrHN9JY+RzJkkkt8jo7iThSsoUA1MKzzKHoI526gU/+IoXh
	sTp5rB88lwMg6ssp9qfIV2/SDWBpevke1UHc+ewprALMZroxn3Y0pBtcLmZqy4MtojNiwFvyVGU
	67twDovBj7VjVjowj9EXjEArqH8XVws4=
X-Gm-Gg: ASbGncsCCXrJkqMU2NmdcNMGnd6HjZoc0ScF6pMZCyByOqN0ULxb2kMlbT4gm/rBqJd
	lIiqrHsdbVucSG/wjOzn9+Armp0+raOxVyJl6a9D+1zop9Mzp/KqyQ/nFpaUaGNURHW+t4LCwkn
	bq59FhPkvZs/m1t7tMbglbnGRG12ZjzQU/ccbZieQVsqVrttK9MbYMgLcsUcPN5de7W04xIWreB
	/ybMIGQAT699xKC4NHjiFJ1faZeWuOW3QoqXXMxvkTsxa6w+ToGAtk=
X-Google-Smtp-Source: AGHT+IEr8P+L0TJR3342JH9xYHQV3+Q0WGlxdbCLJmGp2Q+KPgwKRAcFBDBLv1ory2mNLCloivvxGbpVxzz0t7SLcf4=
X-Received: by 2002:a17:902:8f8a:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-26811ba5363mr43004575ad.10.1758177706285; Wed, 17 Sep 2025
 23:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 09:43:52 +0300
X-Gm-Features: AS18NWCPevQZqr-17ld4WpzvBigiHU7qwZn_PzyMsJ9Y7iuvJrnxcIFdLFQmdb8
Message-ID: <CAEnQRZD=1hxMmR98qfpoH_RFFrSrYMQ6ithFkjyqVgtqWKB_+Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 4:33=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> This is the 2nd series to cleanup the driver.
>
> Patch 1:
> Fix the runtime usage. This is not critical bug fix, so it could be
> defered to 6.18.
>
> Patch 2-6:
> Use devres managed API to cleanup the error handling path and remove path=
.
>
> Tested on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EV=
K.
>
> There is still a 3rd patchset to do further cleanup. After this patchset
> get reviewed, the 3rd patchset will be posted out to list.
>
> Thanks to Daniel and Frank for the internal reviewing.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For the entire patchseries:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
