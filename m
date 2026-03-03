Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8547D94F
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549564; cv=none; b=sOxl438rhzkXE8kLm3WPxYk9+vo1cAaZprYEMMDVC97EQGWuoCIHcwMdYuMW8uxc5hjq4uskujUGSfsjXx3L6Xkjn8SVjZwo6t20RuofYSIjWum4zDIE9dgoxezGFeh1oMyOasrJcn9OghVmaEXTMwj/P9NJB94MK6nBqdPvzdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549564; c=relaxed/simple;
	bh=mSRQ1eMomHCwVtqBWfZCdjiyysv7g8iYFUzJOGWZess=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hyHa94eT6UYdDqqiy0cU7Z79S6kiklr/IXUyDbwwNufsV4X4AfQ0vC7CzEcQzlIeCyyE2Q0ADtM2HywSCVp+yfhg6JGX7VqsNVcMEBb43Yo2aQYeE/GRyo8NyRkyWDo6uxxn+BEeP+kpAejZYwhbR36PN8LvPVAdtv4ZJtxRPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJlGbsYi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJlGbsYi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b7c2788dso1507525f8f.1
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772549561; x=1773154361; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h+8QbcRC2pjzuahdlMd9N/WzqWRbPt5M/XdWso0LY5g=;
        b=iJlGbsYij98khT/9/gyjmim1V6G0Ewm2IeD2QZCZZaki4fFk+hdWh+ENx2WTQKYKk+
         fZURZV6Ld2Yqn6XfuW2L7O0KvjsCmeZUCeVyD/7CQ5uuB619vJ7drBlwM60WnD32215r
         Qv+JjphDGTlS97bBpwqODiCvhvP/tc6KGY2nBz1oihFypdJaSpKiZA9ByIQEyS/nV0UO
         m7FTPqOr17sNAfmHDolimH8u1neSLLr0jYrM3q/fcyUAtD+XqacatikvdE6ve7F0JOy8
         cKF+PDhqv2CboIGblHxL5pBeejFZvz3ieyhcCBEaDhhd8SR/KnTwwX7c0/80hPCqfAv/
         2K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549561; x=1773154361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+8QbcRC2pjzuahdlMd9N/WzqWRbPt5M/XdWso0LY5g=;
        b=NWau2RcSLtcWFvgr+RVkhL/QBk+w5glw2RD1OSv75OlCW3/ujl/+0McBqaLgQySNn3
         l7AmswNSXturbKe7XgGxRA94y8+R2ZnFAk9Z+5aXo0uwvfRSjE3LA1QdR3I3MfiNNn6f
         uGpoasukrI6fQz+dqkPcp5bCfu6szAHO3M82ZgT68ckyjaYUCRb6CDVZGySApuvJLh+s
         GmSEGCanBPANGl/tgNic+R8YlkkCecYzrOYbdUt0M9SY2cwG/wQsSkOkDCKdI/PLZg7M
         Soyr4Pg63VhkNOVRqBPlaWQ9NIrQrn8o6AUyHHhTlQQ2nLubxIrFkM/Wpnz1Xk/p5OFT
         s9ew==
X-Forwarded-Encrypted: i=1; AJvYcCVYHlR7GmgqEBHrRSsmOXg1xOo3APLiBV3N+mm6zNh7oooIe2ZG5FGORxJEucHr/ZBiSO0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1zieUyRERbQlpw0jSXUdKIIu06mirT1fri9okLbjT9x79J83O
	oGmbPyv/vlZsFahiwxk+cRTwvWKLaxt4qNz86XN7utE2UokIBGr4SbuJ
X-Gm-Gg: ATEYQzx9VVs5elBF3m01A9TPEoBqCYZKgOo35t/qZ/WrY4On2Y5wBU9CgbDodxQ4lER
	tdFH/DNffIAzP4FrdtQ5hdtC3yWCzp2ZFYAW5BTFhE5xChqxZgg524neNhzyWkrnnPDykVbsbPS
	CiUbUnaFg7KhSmXtFAeLqOM4DJEFSiMycxLJjUeR0pfDjgZgQxsg2/jQrg5gkPgJNIX6pFkPpWq
	mnErjy7dhdISBsrTIkm33d4q14kwqFeWAC6b7HA8bGodf+VjjMj+KO2LspdP9G3I48k6xFfIavd
	IRtpRq5F7cvfft12Xtauf1418DdhRxizThpTA0Dk10HwQ8xmuBANpFEhY0HF3sXjejV+rjMoeM5
	TJ1ATj/ITziErNf263rt9CmhWucDD2eqed2RD+zCpT0XhXhN//jfAxBiom13N5qxhczeBZVGMnI
	tWbQqypI/IsKG+YlFuPDwV8M3I1703MRs=
X-Received: by 2002:a05:6000:4387:b0:439:c279:32ea with SMTP id ffacd0b85a97d-439c27935b1mr3280566f8f.39.1772549560930;
        Tue, 03 Mar 2026 06:52:40 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm20531779f8f.18.2026.03.03.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 06:52:40 -0800 (PST)
Message-ID: <bddd7c86f5d9535ce5fe58e6271396da40750cb0.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, hanguidong02@gmail.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Tue, 03 Mar 2026 14:53:24 +0000
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
	 <20260303115720.48783-4-dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-03-03 at 12:53 +0100, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use NULL instead (which makes the devm IRQ helpers
> use dev_name()).
>=20
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/axi-fan-control.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-cont=
rol.c
> index b7bb325c3ad9..01590dfa55e6 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_devi=
ce *pdev)
> =C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
> =C2=A0					axi_fan_control_irq_handler,
> =C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -					pdev->driver_override, ctl);
> +					NULL, ctl);
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(&pdev->dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to request an irq\n");
