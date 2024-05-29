Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80795139588
	for <imx@lists.linux.dev>; Wed, 29 May 2024 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006112; cv=none; b=J/7YPzxrysaFom9aRlmhqnGq84YS95hZcX7gvw3jqEA77nQk7o+k/mgIwy9JLEuldYOV+VQcmVbW5Ca+b85tRDKCs+ssuXqKUJmC6xgaOpj6zgYP8o09xBQtU1HJkyNmQrm9IHawFT62w/aAI7LGi3EBc3xinAH8+FFavZTdqkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006112; c=relaxed/simple;
	bh=Mt9uF55EVDUBxNQ4YdviuzhcZ4GB029LkDiCRMI7gZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyKkq9ygpkJBzl7DfJgdUXEB2gZI79CuorJJxjDqpBTMMUac//Ki+yJbn+FyAdVp6g/g4Fb4J1yQT1ZQaSlFkDtRnR/IGNXHBFJrGj1LBc7yf9ULlFKgk46CRyxZWAolaAyte1yTqIUfnFrJOCBCmnE1OaBlPlP8OFsoZslXrZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqlpmhHU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqlpmhHU"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2bfae86f1ffso270a91.0
        for <imx@lists.linux.dev>; Wed, 29 May 2024 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717006110; x=1717610910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt9uF55EVDUBxNQ4YdviuzhcZ4GB029LkDiCRMI7gZg=;
        b=NqlpmhHU9wvda7EDejkuK/gZtwjxPqEam8l5Qcj+7F+jgktVtWds1Ow+udgz7YdBS5
         haqADWQAqTEcqOPPFS7uI+fs88OClX6PpwGRH2Yo4cey1PIJWHOranp17WN9FXoaTX90
         jct98pepJONIsCRBSmJ2GTh+q3S4SzBWORQMU4CdCySeCZjdbocZKliO3b276AdJXZ7r
         7855sDCeci8OoTC6ugU/3Nrjbsbdhwa7ogGT6abxg19QikBNSXvTV14Uff2wmjzvK2LU
         HsZHCnoC3cEPSoihgBwh9SZi0i8QrENl2MlkFOrwJxJMCYABhHOMXXwSW+963BXG1OUN
         6Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717006110; x=1717610910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt9uF55EVDUBxNQ4YdviuzhcZ4GB029LkDiCRMI7gZg=;
        b=ibb3YIlCD9bnCgCSW5HDUNdi4BzmUZS+di0Ws14Y41aewWrppbUsoNXjSCDsrIwCQw
         rbwwZZzqCDwh3W9X6WXDbfsbq05f687Fi2TN4nqLWJVredhd5aqHelyvmQg/+JHYLC5H
         RsLA5W3ggdoVYM3ZdlpJxS5gIEYr1D9MRywXc/i8Kw4N1lmoQx6PQm5eb1SsM+XH0wI3
         u2R1l7PRsnqUFp0VI3XHYjex45/C91hcfYvGZfRC7mF+Bq5ES1PXt/JpmqofiWFcAETJ
         xBX4HBvRrXGSoHFyEn9vIdf2/9HC2n5eMWopStNd4EK1O07jWCdfBBuEL4x1/J6x18cc
         U16w==
X-Gm-Message-State: AOJu0YwdpyX+5XwJckCYXnhG/swEUFah5AZyk40sjBOSLl8G/NRQjE+u
	/YpTMyTGeLEp0+MkNV6GguN3sTM51LqSGNFV1F9zCJN3qZn7qE1/R/DPA86/ZqNPrCSf/YXxspc
	Bt0dbk/jXi33ZFP/raoZsG08wqJbGqVn7
X-Google-Smtp-Source: AGHT+IF8ArbKkv7A9KR4UVLZD2CgyBF0OBAeZ5cdKLu/Y1FMCs50pCEqoJ8VHX+eayXQi365Z3ovp191t7QXaeh0iA4=
X-Received: by 2002:a17:90a:ac05:b0:2bd:f770:f95e with SMTP id
 98e67ed59e1d1-2bf5e068cd9mr14984866a91.0.1717006109900; Wed, 29 May 2024
 11:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5B0+jkaPo_6VKXVGb6SMAa78jLVQU3xUt92BpkAzc5AnQ@mail.gmail.com>
 <DU0PR04MB949617775A095B8DE513D97690F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB949617775A095B8DE513D97690F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 May 2024 15:08:18 -0300
Message-ID: <CAOMZO5B7Zm1RXRLXs=_Re_onUam=RCy_QYUkEtGz+qvKmz=7Ow@mail.gmail.com>
Subject: Re: imx93-11x11-evk: SD card is not detected on 6.6
To: Bough Chen <haibo.chen@nxp.com>
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bough,

On Wed, May 29, 2024 at 12:23=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wr=
ote:
>
> Hi Fabio,
>
> I tried kernel 6.6, with the following top commit, sd card can work well

Interesting. I tried 6.6 and the SD card was detected.

Then I tested with 6.6.32 and the SD card was also detected.

Some intermediate 6.6 was probably broken.

Thanks for testing and sorry for the noise.

Regards,

Fabio Estevam
