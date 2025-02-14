Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65225227BBF
	for <imx@lists.linux.dev>; Fri, 14 Feb 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523036; cv=none; b=lbjM7gm/wqNWnARxm/PePG7wz7I4zIcquHSnGPe49qzIbzpm5bp65xRJeCdSex8WzY5R7fGS9eVkfFLomPm7x2Vkvvj3Vv/vu45jM7KAJPMEZgwpThD2mYJJhmBiNdT+/emF0bpaLRUO9jTODpJt/PiVNEe935trTLKXi49obsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523036; c=relaxed/simple;
	bh=FIiFh48SRloeLYrhX70YWBVGVz+5pKIaMXokOTKVowQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKvWFJRdUfB9sREXAQr1WCdKaX/oiaIDtpkVhWwKxHTve8afqtSJ0L2d6ySzYcdEL49cUbA/zkvEOXGenVRawx6pMXRQ5uGwxkOgK2fu56LvmFwVdqe0keKOVMm6f20O4dHRgid0N6f/Jf0o/gh/ulRqJA3a8V3SlnotSf9EyWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STTOwRlV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STTOwRlV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fbf5c2f72dso2904983a91.1
        for <imx@lists.linux.dev>; Fri, 14 Feb 2025 00:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739523034; x=1740127834; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIiFh48SRloeLYrhX70YWBVGVz+5pKIaMXokOTKVowQ=;
        b=STTOwRlVd58yWAWjuwT+fshL4T6NXBe4682wfSCNoIm5RspS7WFu3UKYTJIxH4lVr8
         aBTYTXYs60+ecVkzw08PDzzc5C9DbENBcUdN7U5O7FX2VmRagWgaJ8edFb4rJQfdfzC/
         3R6+muBJ609y6guv1uf8h5dIhJHEEeiFnhvvO9PafRCuxChxP8hoYgsH1En5NVk18fgp
         Cwj4b9fjnaWy4+mcEb2cOg4LZrkep/kr0ysA8Ivq1LuAK6F4/tCYrw7Y783HeicTdyCH
         HVO3EF/Qppz/mP/H3jLkg1cZc0Po10ij1SWwO3vdv9Mu1tGSQDGd6a2UX3n80cp5oTV+
         8K8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523034; x=1740127834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIiFh48SRloeLYrhX70YWBVGVz+5pKIaMXokOTKVowQ=;
        b=SC3mcyNFdoVfjVIQ24jP8AZYvcbwRr4qZSbh3Xn2gIzLhNwXKQIRPlEMtk2S/Hwu7O
         06bFf/p8b4dzHBxxQJHZIpJiFF9ezTikPgjZFRxFhDqfxhxCRnEoMuGg0t27D0W6F9UD
         CqGCu+tfRpghobjhKheM4ptf/5CdTOl19grqBGnH+JvE0dZCnQ1ZCScdCO8rbmuCFevU
         N4kf4o+c6rYmTi3XZYDPk4h9OE3xCnekVjwP8M3waY0/dpIr8JGsDD0jnaceVHCrLGh/
         er4W5patWO6gItHu/L3FRW2PPbiT5IrishP/SAbrgn1qYFoKXZUX6VO236zHCvHqCFbc
         UuVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWba97bgofd2kGPkpy4KIM5epSqtLUXc9AdPRGEhterYj9aQJrwzfQgaqDTbhCVWR+Q+74=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5h0oYFLcDjk2pCbgxODxsDbG98x/v1CkXTwrWfB0G6Fwe2ufF
	5WNnhaLcEYrPzIqPMbACsKL7xvyWaiCTQmP+mZzfsyK/Azf7n11SGgJ62ztc8o1inU9cweHgxRd
	rn1tRThod34wis689F5mEPGc6lEY=
X-Gm-Gg: ASbGnctg4VtGrYEo+rTUVO/l0pMueVeKwytHGmPrljs6wdchGSzHlcR/tuP8W1huP/v
	eOuGmNN80s79ulkbx2mUG7QfuSpY+F8fCYMMW2SyVd+xKgwlef8RMdUwCE4LNuCOQ+CnjWQ==
X-Google-Smtp-Source: AGHT+IHiUFULatLaYVTG50OelwewoeambCvXM1mTQ31PiJAH6oiIxTBI5F18bPDN/bN5hq3LikyhjtSIbsUPOxZ5ITU=
X-Received: by 2002:a17:90b:518d:b0:2f4:43ce:dcea with SMTP id
 98e67ed59e1d1-2fbf5c580c0mr16296822a91.25.1739523034540; Fri, 14 Feb 2025
 00:50:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241206084817.3799312-1-peng.fan@oss.nxp.com> <20250214040457.GC20275@localhost.localdomain>
In-Reply-To: <20250214040457.GC20275@localhost.localdomain>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 14 Feb 2025 10:52:08 +0200
X-Gm-Features: AWEUYZmgsC6Etzl4Yr65LGIQ5Av4XAoNXRv7HFJ-K1y_EhMdzGRHl7TymfpRoOo
Message-ID: <CAEnQRZD25RrtAzAy4B9WX3+1iUuLdt1cgZ36kCTr4poawP1htA@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] dmaengine: fsl-edma: cleanup chan after dma_async_device_unregister
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
	"open list:FREESCALE eDMA DRIVER" <imx@lists.linux.dev>, 
	"open list:FREESCALE eDMA DRIVER" <dmaengine@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 4:58=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> Hi Vinod,
>
> Any comments?

Hi Peng,

Do not send empty pings.

Just resend the patches marking them as [RESEND PATCH...

Daniel.
