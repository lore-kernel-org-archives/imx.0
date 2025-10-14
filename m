Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BC819F135
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 00:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760401814; cv=none; b=OTrDK10D8ZDCsjTs9v31xNAqTGXzEgANUHWvIoO31OYeDzgIVaAptirQ/S3rXsvv2lUNPkf8UWNQ8eNOlkJ9AJe0xb8YVwTthJlkU6K9NdGg23fS/tlAlW6GgzsPZdDO/hZHsgIaF7nJ1tH+jZBkY0Oj+0UpfiFUZkyx5qId9+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760401814; c=relaxed/simple;
	bh=FL0O6oR7tFBbgxorRPIiHZOqnAEHXSA3uOI/qucr4Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7iH62udQKIhoTZRL9th6Vt/RyCUj8WcpA1C3X43FJDucaqnE9IXzeoyaqC3hxR8nxEt0KRIdZjm5a/ydJlyz3wQlGyMKn7xPKEwAiywdxiGFvP//0Or3hOuv2KzcqmmAdWtq9ZA/JUWVbtYT7JhDz9bKxcAIT3kR9bD0+ke6wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAxQPTWo; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAxQPTWo"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-749399349ddso55930357b3.3
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 17:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760401811; x=1761006611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL0O6oR7tFBbgxorRPIiHZOqnAEHXSA3uOI/qucr4Lg=;
        b=AAxQPTWoE80SX9Ibu+h5YJk58mtqeCKCyeB+F40mcqCx975TPET8BrSZxAwp6cCVCV
         pQMvZy15qSi5AqoBe2O+HtWGWrIHtEfoOjuhW1aVQlW0pwminMWUsAAE3GdcSw9rKt5m
         9nypT2vim6cqrHBM8IaU2vii8nCrLbboel9suxtX2fx2GSaQbu1whSPh1Ri6zhMER5qi
         jN2jhoM419JjZIu9RtGUBctAzywdYkaSGpsZ0XOz7ef25WAJpKtyvSLu95xOtZmwJSKZ
         44tZaFIg74jVc3al5L3zqJN2FVea/RDed8roLLhLMX1nj6UtKCH+eqs5RMy58yN4BsBp
         Thnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760401811; x=1761006611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FL0O6oR7tFBbgxorRPIiHZOqnAEHXSA3uOI/qucr4Lg=;
        b=oU26mY9RtziWhqskun5UqvILQsfb3SYeV1hRXiOgPVVld6mYLVJvEwDCaRatZhuwex
         HRQsQxAqQrqD8pzbcKp3FjwatYboiQiHjkoMI7A3wWEDEkE6yxqi5dnni9K/BCAc4CxJ
         BHbniGiQzyjSvpo+Zf+IGF/m79X03SGzoZisWa8y7eg+XEuNEuor9bQ/wq4yVWWF3YV2
         sjS7Kg73VlCWc3cOtw20bOyHEVTtHWRhF/qN+VT8tfhVBNN4wgQ2+88UukHIMOMbgSdI
         5iB+smxhS7wT3RreiG5YAS/UJoxDkbzXEZz01Mfvuu9HD0nCSwfTCfuIRc8Gl+4CfZlB
         Lwpg==
X-Forwarded-Encrypted: i=1; AJvYcCW5NsUfIKBNYjakZ+jkcPhBK+1xJyNdUy9JILr8iSXq+IjM4PGMdyXFzVEU2ur19lCheVg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFctYF0830sGeR6ncvB5yvlctf9sZCUFCyL0hX63ly+FUDtV1P
	qKyfzzEjhkNFa+vEIGvbgs+cJIuic5h2c2bEPZVAhapURuZ9YCXyS8cDObyQcwaFyQ1ptd92eyc
	jLDaNH/450KVBUxEPcojphUb7x6UXnT8=
X-Gm-Gg: ASbGncvzj316PIHFjsTiqDK8L9JGP/aMAMgO3reJwrsOIHbo2YyWEg+/GV9isV+qt9r
	ovsBeXtd6rNT9aC8LA603A8c3PzvEvWTvRJABzFFxv3ftOj9clrbcFYVn452dvj0jmWTzlBUXul
	VY7wD7OTsTbhDfv1ScEpVMLxan0CLmQ9/MXuW6Tanj7xXwq8Ss5T8fkWy/vGWIKQ9YAeVsKJVRO
	0fnPjvdJICD0BK1MmvqG0va5dRCw1XsTpj9dal1KBOReN0fED8u+u6+nQ==
X-Google-Smtp-Source: AGHT+IEUvVnpl14a7Q5M/OtoBNBYZn6+9fewhUttiUvAPvVoTebCWbrrZ3wpmAZYfXuUtNCIrHfIKGkBJJx456zaMyI=
X-Received: by 2002:a05:690e:15c7:b0:636:5e6:cac1 with SMTP id
 956f58d0204a3-63ccb7fb22cmr19733855d50.4.1760401811361; Mon, 13 Oct 2025
 17:30:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013121709.104546-1-andreas@kemnade.info>
In-Reply-To: <20251013121709.104546-1-andreas@kemnade.info>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Oct 2025 21:29:56 -0300
X-Gm-Features: AS18NWAiJadHGMJZMT_VxfTRlUlHgWEUDMnUSc2rSEDmAVW-OfdMZEsrg58YfMs
Message-ID: <CAOMZO5BQQhNrYyjDRSr+bAYUa57YdFcroY-hi=La9aOSEAwURg@mail.gmail.com>
Subject: Re: [PATCH] arm: imx_v6_v7_defconfig: enable ext4 directly
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, ebiggers@google.com, ardb@kernel.org, 
	dario.binacchi@amarulasolutions.com, martin.petersen@oracle.com, 
	alexander.stein@ew.tq-group.com, stefan.eichenberger@toradex.com, 
	lukas.bulwahn@redhat.com, tytso@mit.edu, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Mon, Oct 13, 2025 at 9:17=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> In former times, ext4 was enabled implicitely by enabling ext3 but with
> the ext3 fs gone, it does not get enabled, which lets devices fail to
> mount root on non-initrd based boots with an ext4 root.
>
> Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Thanks for the fix. Just faced this issue.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
