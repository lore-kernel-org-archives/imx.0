Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC927A133
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702977; cv=none; b=X/hY5Tq01qI1ef5KXu7v8FH7fGE0otiB0eXvXfUV9k5FzMHfqOZWuvFb5zIbLUBoYz0al7IA/HPrvUVtQxc77UQ2zj3kTemA2+0rL6PEI9NeQM2mcTf/KVEIDNNAe2cCgxX3MRLm9gP3GEZk2VesdTFiLnBH6ZXj5NXfOqM8w4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702977; c=relaxed/simple;
	bh=FrsM9iiedOM/M5mnaIv6iS/9Qia3AnBQr85/ywInp/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eK/PSgFfy/LD9mlfh2MVwxwyZ1MfHVDjoPgIMJzYSLy7S9mzDs6Sn3YtundSf2docQHQE/gNa0M8WfExgJvjmmHmuzP/CauYHqQm4dAX3Wm4j33XBg2H5CZbbGHy5ak6PKn4LYgrxMrYB4iNmcqVv/Sm6dtb+J0YceelZeN+aVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aE29gBUP; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aE29gBUP"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5574538e87.2
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702973; x=1745307773; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrsM9iiedOM/M5mnaIv6iS/9Qia3AnBQr85/ywInp/4=;
        b=aE29gBUPGJPWnUn4C/r9Av1OILitKIVMrumXqet6d4FKpnV/2Pbp5b2wOdf1YXoA4n
         j7Z5P3QMg2pn0RzEgLgHsyXAZAyiVeuwmKWi+FmGSGLvifdlOFm0QD1EE/iqOQf7MLl6
         10TOkh1LNw5Po3li8OGgRR7eDoCyE9e7MwQAbFLIrDt84jpgDiy8QZgTjj048CxfYUV7
         kV02XNEREW3P4GE+0wJk58r126vVoYLf216kYRwz4oghcvRkPddSJziBE2xN8SHtVMmv
         X3/DpGoEFMO8s1Srqb8RRqz8DR6XFYyGv60GSMVc8wqKT/ol130lscUb/4iG8SISu1VO
         0sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702973; x=1745307773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrsM9iiedOM/M5mnaIv6iS/9Qia3AnBQr85/ywInp/4=;
        b=DK6XSGv4dG+aKKTQWnmgAbdyIbi840PCKKzZaebVB8O75TyF713X9XmlBXkOGECpG2
         4ffMmX+m61mEumizvDMBNBZjRARdb6/yfWIdBNZLLlWMfvmAEIOPb5P7Imhohx6zxYmv
         N2dxFPFcj/WFd/S5tjYm4uTn6EZwQi4gVwhBS1s6gJjTevqGSAebePIPPFTCGVFiBASA
         7bXe8U1H5qUnw6oz9VfuqvvcLOao+9N8+KEF7P1bRZH1CfNvzRT3mye3wTx53w9icNDl
         tLTgPo3utZwF54Ui2hGmaF3eFMnghjkCyQguV4B6c7lZf1S5j61DJ7y5EyZ1ti9M2Hzt
         dNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuTRJ85SQQ4egJiMEU+AaGoaT01QbMD+oRFPPPQd6nomQkEeWh4h5qcCChcTY0cGEctR4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJIKFHEHkfh8NmjQBI5ulGgTc+QahBIWnF1OwzPXQXSbfE6GHw
	o8+MZjtwgnxgGdgqrHp/Ff1f0DQdKxi1rquCvjGWGyje+rgcnZfk3nUQ8WgrYofEzApUgSQWeGc
	s2yuwsaVdMSLSfA6lfK+uul8ffevrWmFXq9gzz9wBEKJ4KcTA
X-Gm-Gg: ASbGncvQlytVpCoHDcLs0ww2ahkKB0Aqe0j3g3zZKAiwoiuh/FSM7ggs86cyanZgHsT
	CqxkCe49y7UYh5r8vhmpap78CULNQEHthSUPY2oKwYpfBbpAyiYIojq1tlSWFuEmZWJcQdhGkjF
	Qk4XsBpi69USWOS2GMnZoPkA==
X-Google-Smtp-Source: AGHT+IHgalo+jgjuU4utc2ZA9vkCjPT6mKMoSs9gFwa/t2RC/E/zR4Ajm6IRPAJoOEy7VIxNy+yoZ6pnwQHeZXy+WQ0=
X-Received: by 2002:a05:651c:1464:b0:30b:e3d9:37e5 with SMTP id
 38308e7fff4ca-310499f5f26mr42974901fa.13.1744702973134; Tue, 15 Apr 2025
 00:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250327031600.99723-1-hui.wang@canonical.com>
In-Reply-To: <20250327031600.99723-1-hui.wang@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:42:41 +0200
X-Gm-Features: ATxdqUFq6sWueB9SaIFT69Cg8--gm5UGb4eJdUIGm1zGwfAodpETvC1tP1jdc-8
Message-ID: <CACRpkdYSSN6OFAfCoPeW50a3hiDJWv3huBaEopuprgJa+kVZ7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Return NULL if no group is matched and found
To: Hui Wang <hui.wang@canonical.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	gary.bisson@boundarydevices.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 4:17=E2=80=AFAM Hui Wang <hui.wang@canonical.com> w=
rote:

> Currently if no group is matched and found, this function will return
> the last grp to the caller, this is not expected, it is supposed to
> return NULL in this case.
>
> Fixes: e566fc11ea76 ("pinctrl: imx: use generic pinctrl helpers for manag=
ing groups")
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Patch applied for fixes.

Yours,
Linus Walleij
