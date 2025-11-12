Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FCC32D44F
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762954375; cv=none; b=otHdkOpHt5D4m9uT9e3+70mNqFrl7LObv9286vnYxgMBkhcC+BxK4wMps7IkECBFh56gMdzTqioPep5PYaFsAnrux64ELkalEpO2HufGfirhWRkP/UQ9X1pmJDf8ztkHLXKelopACYIA0S8gUevsgwBSvthjimQjHIPzwtoqrQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762954375; c=relaxed/simple;
	bh=VBeqKMSy6YDlSMoYmNN3CreFZlAikXtDai7sNBXQofA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqUu4EJJ9YXVN+OX02LM24w2Z6QyvbQFTBSYrQe78Ww+3haXHCU7gjFJPPJCpeMkPNGuXH5VJziGbJ04Jqc9ExVzXxP9x5fG+sKraX9ZMzXC4aYWo7vx93eoBkAg0mpu7s/Mo2kyAq7baSOmD/imHOKS8wjw4Os6hpdNY4nsW10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcPd7ijo; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcPd7ijo"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7af603c06easo823697b3a.0
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 05:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762954373; x=1763559173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YGhgYj3na3lBzf4w1UXosrLsby9qm0K/6mBJebDsWI=;
        b=WcPd7ijoetMmBBT5NGY93wVzYVCXlRqWOHcmBZHHTZCSSbOMsGY6TvCnpQhTnG49B0
         2sCTY7R3OgO5Z+8QU4VhKZA8uz3cW611Pf8URj0pJ/F1mixtK0/k2vIVxkE4u1WWvb6/
         yaZzcAkqFpPv1D/f08V6Z29vdEUOqXH2Tm9L/FC5/O8J4Ehw5n5z5fjVh4QQ3A7aHwp3
         Nwi9bJDAA7QKhr5sWwew486B7/5Gl9q3rAtn0c/dgR6v9Q9/ow34OXd+A65scoUal8WO
         6qeZSUWopTYNF/K1v61fUHW/cdIPP8wvHmHD3Qa9A88eY6kfKYucjf2QNmAJaKonAwZC
         H2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762954373; x=1763559173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YGhgYj3na3lBzf4w1UXosrLsby9qm0K/6mBJebDsWI=;
        b=oStC9jNDCxpuTfzlXUd0v+eItY70dFz+6JAlyanDdJGflGnDqc+0yYocGyw0Qh6891
         tkeQ5m1QVBZR1qhU7iQX+tKhbBvujh+Ob1IM+zmd9jcP0JcNwg8di5NLR8gFQ5o4+pKJ
         X/9ob0JmckSKs62ZQPOv+inmWGgOvqFZs8sAx3arJCSAecP5gKAx/s3fEapWNhlgX/5m
         WwabGLSo0KRMSq/3ierjsoi0rJHXCX1BC5bx1vln/bYtBzocxQYK2Z6W7lcjY4AocAaY
         MCWM+O+4QJ0dLDhsdJq3fk5/hsCHdy8u5oUDMUaPpDroIcGCuWf7MPO6ockzCsWIPrr0
         fbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoV1UowV97dwHsIkf60nJn0Pp+pcvzNvs05yq8JYbrRqns1gZ0P+SeEnp52r22z29Mn+c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUshQxScYrc0WI58y1xHXK9uMY257mNNgwQbx0TR94HndccZO6
	6VD0gDspsWnjyv85JW02OaufJ6gsRE9+WBnH6mHX+iElhqAxzDw94bJUN2Q7v70NON5WZypgwgf
	vDpQo8nkZbWfNGAjITEU491JZ2gIU0b8=
X-Gm-Gg: ASbGncuvXpDobkSw6UMcHoa5Z3h1TVTpZzTqUppaDRaPzLBQbTOJtJXlLfiKGBiz0dW
	MbSlPhQxZFbPQTvNaav1Zk4+gF2qm+IHl8cjQxYIn5zLiox1jqtrVut59Gl8u0fqvyyQ/eZ07zV
	YwGd0+YP+AcVr1ex8DfhASb9JsbZ3tA988/9nS+C/lBb0YfSHcYTYlMZVQFB3jl0o34pYJPv5bQ
	46SIbXIz7YLFKjCMwJsLNgm+Rwo1HGbMtMPeZQAFirOoG7BaYWTtGD3+jhiXAr9hLyu
X-Google-Smtp-Source: AGHT+IH0s1R5FFxg23gO4NcrxeoCruOm0w1P1EMsauVWBqLInIEKMlkyeUh1Nk79roAPnbvPjJADnE2pjL0vjVVJ+WU=
X-Received: by 2002:a05:6a20:430d:b0:2e4:3c9:2ca4 with SMTP id
 adf61e73a8af0-3579b7a2f1dmr9348903637.16.1762954372919; Wed, 12 Nov 2025
 05:32:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251104203315.85706-1-shenwei.wang@nxp.com> <20251104203315.85706-4-shenwei.wang@nxp.com>
 <20251112125741.GB1319094-robh@kernel.org>
In-Reply-To: <20251112125741.GB1319094-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Nov 2025 15:35:16 +0200
X-Gm-Features: AWmQ_bksp5_b2fKuYqlFUSD5X1hhR6adsSbKyYke1gTN6bbO51U9xJrjNuoDAyM
Message-ID: <CAEnQRZB4ymvSERKhJW=PAk5xA2JYD=i4wzkbumj_g5S8BjONjg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 2:59=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Nov 04, 2025 at 02:33:13PM -0600, Shenwei Wang wrote:
> > Describes the gpio rpmsg transport protocol over the rpmsg bus between
> > the cores.
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  Documentation/staging/gpio-rpmsg.rst | 202 +++++++++++++++++++++++++++
> >  Documentation/staging/index.rst      |   1 +
>
> Why is this in staging when none of the drivers are?

I guess that's because remoteproc.rst and rpmsg.rst are in Documentation/st=
aging
and that's because when converting them from .txt to .rst the author
didn't know a
good place where to move them.

Would Documentation/driver-api be a good place for these doc files? I
can move them
and then Shenwei place the gpio-rpmsg.rst in the Documentation/driver-api a=
lso

Daniel.
