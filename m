Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA4383BA
	for <imx@lists.linux.dev>; Wed, 13 Mar 2024 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710324919; cv=none; b=GZfzij/iBqCrgQnnRkKDEA4P6OsZ4xhgqtLeb/Cgy+dMEaV5yEiinbsJGKYmLv3ymHnyiB5oMaTFeIVFZ5RvhKTnJBJK9ofvKhJGucPiKLsC6rs+gxvT8oT4hfW9DUtnRUd7Y8uNv2IKsAhA8pvyD6617Nir5t6UHXNT7jM4VtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710324919; c=relaxed/simple;
	bh=aXTCLlS4y4QEhlbLUhInaMoXhFqY3QaANvShb1ApMks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoy0e+bVhtySffYrLAq1x+ftEt1xQ2P/KdYKZyy8e2O/yr1SLR5lu5nUnMHfY0MKBbg+20mKeftXir39v3PntVaNr9BVDjVHWQH/QqUQSifRFfnUtjoanaOjNqVKGGtw1Ck8JON/FyYk8i6hsO4XsmLGZw9Ad0CsiqEQatued8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPx7Zk/m; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPx7Zk/m"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29a5f5ea920so857913a91.1
        for <imx@lists.linux.dev>; Wed, 13 Mar 2024 03:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710324917; x=1710929717; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQiuGj7PdiBNl0+f5A7u09zOwXRzHIjc9Zi58L9ZCcU=;
        b=fPx7Zk/mDvAxX7pEsEBcaYVun4l+geE2Usd1NQ7wm2CSyWCEk8BJZ468athlfHWBKm
         FSuVl3cP0EM2ooNGdS31xxUTz4mZ9aRIuLjStv4D0fvNiFJ7q553OqAtccbVbXUXkcb/
         DH7yQsP6clMNa2bKlNc7D+RLyjLTX3i8PEk9+3bFRZnkxVzfhH9mPw4Z9pDxUNAPGooz
         qb7VK233SvV4sOuEVbHDgNqF43aGsGkeYlpq2YERWYTvsU28K2dKWmFuCnwgHmXNvdEt
         ixJhj3eK9SoX4iZkaUsIIEzpFTZX8ijidMlZnQylkU37QTTCCa40HbNT74pW4RQglpWs
         SYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710324917; x=1710929717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQiuGj7PdiBNl0+f5A7u09zOwXRzHIjc9Zi58L9ZCcU=;
        b=MqaAaQdMjiLEwyciG8eLDD6A0TxxYhIsJJBA8esddvmW3+fjY5gjrWJm8XlgMIIM8B
         aGxVwJ2tEY8/jVBkbO+m8ypvyrdluZkVE/LJKZlvt7VUlEKECDN5g4ued4M5vYH1g9SF
         v3EfqDtRSqbCgpHlxR2cgGOlTdXiJ3l7K2ssBbT0b2fKGYtMqU8Tl6x0i43FBEEzKxQC
         cYiaKys61Ej/U3WeVvcFsLzF0s21iugh3MZ9lcli4sPHOdtB57MULoInWrNYs+JC56b+
         WpMc1XH8z008mbXruM7UOfAB7p+UTU3uTny4RkQqNKH58ZrIzKlsLOx+47VABm6VRtr0
         /S0w==
X-Forwarded-Encrypted: i=1; AJvYcCXPWJoLldzWfLMum76UCq+z9ChiZK1PqvAqgaEPuPLODhAjMPEcnI+1B8XmaFYPc4Ti+ZO8Hdsqn1atXyu8vVaqwML1
X-Gm-Message-State: AOJu0YzKGTtka2Au9OlRyv8xIsAxaq7jDsFc818iMPymwRiYU5EA4uVX
	GJ5rh7ZHXvKiOH/0Jayp+VIo3CL3k7idUGOg8+nwNUQorG2lzocPqhwZ2Gb15pqc6w0hsd1r07X
	sdBPKpVAC9Cw+I+clqoYW8CSmgZw=
X-Google-Smtp-Source: AGHT+IFdJFcl/SekdaJH+/L4KOclnX+rJ0Kbf80hXyVdh/bz4CV/ejFTQkgi9XmXAQjX0FJCQ+yCTkyB9cnpDtcMmME=
X-Received: by 2002:a17:90a:7186:b0:29b:ff24:4426 with SMTP id
 i6-20020a17090a718600b0029bff244426mr1061401pjk.2.1710324916981; Wed, 13 Mar
 2024 03:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240307-sdma_upstream-v2-0-e97305a43cf5@nxp.com> <20240307-sdma_upstream-v2-4-e97305a43cf5@nxp.com>
In-Reply-To: <20240307-sdma_upstream-v2-4-e97305a43cf5@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Mar 2024 07:15:04 -0300
Message-ID: <CAOMZO5ARM2pS93jLjpYZRfLU-tohuDXUZxDrWFjvVBGtH2t_aQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dmaengine: imx-sdma: Add i2c dma support
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, Robin Gong <yibin.gong@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Joy Zou <joy.zou@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 2:33=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Robin Gong <yibin.gong@nxp.com>
>
> New sdma script (sdma-6q: v3.5, sdma-7d: v4.5) support i2c at imx8mp and

v3.5/ v4.5 is from 2019, so not "new".
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/imx/sdma/sdma-imx6q.bin?id=3D55edf5202154de59ee1c6a5b6b6ba6fa545715=
15

I think you meant  v3.6/v4.6 that Joy Zou has just submitted:

https://lore.kernel.org/linux-firmware/20240313071332.1784885-1-joy.zou@nxp=
.com/T/#u
