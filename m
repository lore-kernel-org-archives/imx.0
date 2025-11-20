Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376B3451CC
	for <imx@lists.linux.dev>; Thu, 20 Nov 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646804; cv=none; b=orgWdSb6HeUMXFhG6dy8N99sCmB8kDhW3qRY2aKMKc8JiWiulbaQ2oGV6eG9p1E5ZbWE6GNaNYKnC29RX4iMEJNDyw7IIVN8xS4sEUAwVw5K4UHHpDD/T6cBZvv8Uk7FgUGLS9GDv2Z5NlKJJCutDiCr8AZo3ZoF4RzURhkI4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646804; c=relaxed/simple;
	bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYtFuC+CE0PnOOCj0sm8d6kxjVMH6IDNOpx9Q6RXtwRiWnOj5Mbsz79lWzg6Ti9XVE3hsrTTqsAr7cZ7NBNSjk0gZhNko/p+3BHfEebeSygzvF6ZYMHTzfcXUITIqjxYMdBAGG11SEM8KLNK+V2Ayfp0AJKyIfVV8LojdqdTiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zts+DCdI; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zts+DCdI"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so1100118b3a.3
        for <imx@lists.linux.dev>; Thu, 20 Nov 2025 05:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763646801; x=1764251601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=;
        b=Zts+DCdIz4nzOteA5ViJVKUpWnQOiRCd4QTHtOA3c7MpRtvZLNC2S1880P9v4652AB
         aUwePzC74iAFoaXhZ1BdjF2lxx20KAF6tJexju+To/SOfcSvT3J3UD9WiNyPQlrQKz0a
         xfawBsalVwKzNZh63fs3hk9IJQOJ+USyy54UGsOCeqmyvLuK6Zs01M2qxbNxdOzHYrW0
         4d1qw15hq18MhYCTf0uKkPqZOn/wxXOhsXCpq/Jb6sbg921n2IhrGRpTicizW1zvnbBD
         HwSpDKjJv3Lvy5QTDUevLNYTKQiouGhXygOdWifyold40OlkjOh7PWEILLSDZxZKLD7y
         u8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646801; x=1764251601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=;
        b=nr1QM7owJQj1jBVKWgP9OEVLpD3NNPvQ3kIdpTG/M7RN8JNcu6i2i/FkximZ88KrhV
         y9aKI/gNMf7xDlleb4if86T6odkDzzUHbn/9MAOS16Uyz/AevIVS50Qoeyqoj3ixF3M2
         3Qu9FgvlRxPiNIdPyKyc+tbkWoORc7JrA26orDQ4RpPIVbNes7eKfG1oj3Y/nNw66FQ7
         hIk838xEm6HJnSLvDyI98oNi9K7fZ4JBFL4ns1Ke6ptfI8TUT17ehPKLVO3zgDU16FgV
         4AqnyUwenPrklKKshzszMJlW8Iy0N5fwx8lhTBPlsEZutrXjE8eEt8ctLy+/dAmZ8Lqw
         gQyA==
X-Forwarded-Encrypted: i=1; AJvYcCXHcGRL6hjlM9K+z+WRiIX1QN7UcdhdCba7+AldYtuQd9LH7cw/kjuHUbj48uDJ7k7WhUU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsapIqpT8M0QIR6D8QnybF0t8t/6GQHoU+M5XmgxWkGkF1lTbT
	iKTMYiRfWhGr3w84YiLase7YD+3PBuF/fYaSxFvIUWNamczxohWKi+GB9eJIjbSVzgaP7Kfdpqx
	nXWDvR+8sSFZ+egguDiGPasoZ5Y6prKU=
X-Gm-Gg: ASbGnctO7wrSlhSFlbBy7tVmofyjRZdE93AlNHz4ciQExtEKnTc4oABdq5DY7qIB4rb
	+k21YxjpW/R40BwTAhYZjT9/+MhYU+Hq1LYaV2OG/8qkZDzDJftgsIGyFH1I6fziuYstDMIbVCY
	m0q1NdK7kFywPiuB03Oq2XHDqk35FcDRiuqJXRq0vX7uGOCbEVT2SrfO/M0U8hf5fNHB/5tWTZ3
	Cb/v4mEFQKrCV+Wjm8qRSDfRCeqa2wofzj4ST3oSuAWoYFDgvz1QaAHxmwR+GwZDdNb0FzKOQba
	lZ68Ffo2HrX3P7Daf9bKJu9//225VgrzN4zUltUxpS3HmM64wmXW0Qw5xc5nSew8ctZgrIpyf36
	2yhOxg2JI3Q==
X-Google-Smtp-Source: AGHT+IHHiFdkRR2hcs7aI5ty0G7MPp6ZYGVQIosVcIdjzscilsxzXmB//cKbxOhtRhNsGf+CdA6qCE9WHN4qhmI+au8=
X-Received: by 2002:a05:7022:6714:b0:11a:61ef:8491 with SMTP id
 a92af1059eb24-11c9476aec2mr708193c88.3.1763646801541; Thu, 20 Nov 2025
 05:53:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120103039.1824209-1-carlos.song@nxp.com>
In-Reply-To: <20251120103039.1824209-1-carlos.song@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 20 Nov 2025 15:55:49 +0200
X-Gm-Features: AWmQ_bnQa7oBzAN6Aw7zvXpCjSq9C--w2oU7R6YmaimQUP4lya11WGpioKQNFS4
Message-ID: <CAEnQRZDcaWAQTLVHL1q+n2nhk3Cop2-fbOL+BqibrJHze2F9xw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, frank.li@nxp.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 12:31=E2=80=AFPM Carlos Song <carlos.song@nxp.com> =
wrote:
>
> EDMA resume is in early stage and suspend is in late stage, but LPI2C
> resume and suspend are in NOIRQ stage. So LPI2C resource become ready
> earlier than EDMA. When IRQ enabled, immediately slave will trigger LPI2C
> to read data and the length meets the requirements for DMA usage, the DMA
> will be needed at this time. Within a very small time window, EDMA is
> still not resumed.
>
> If a system-wide suspend or resume transition is in progress. LPI2C shoul=
d
> use PIO to transfer data not DMA to avoid issue caused by not ready DMA H=
W
> resource.
>
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---

For future patches please add here a small description of what changed sinc=
e v1:
e.g

Changes since v1:
* updated commit message as per discussion with Frank.
