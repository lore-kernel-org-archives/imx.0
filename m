Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EEC1581EE
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287957; cv=none; b=MgGQtpmse2PV4tdYJR7NNONLkoiXSg91b9BMwJWe5pYe9HAukJfCr+ZojT5adr/x9WZHTwgb+VBVxF7dl4Vps2J2uvh94frhICRXpJyi9wcfFQO0EicKOpQpAcE/m4aeVDI4kyKh+llkjU8WAr9BjQm/SPW2qZ/Cekl25wD8ZLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287957; c=relaxed/simple;
	bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHkLOfhC8/BcAenjy6Kg2cl7gZSBox96t/jna7Enf2CPxHqptNVuxPs9PcfGdlugEQ2a2OJULKxHsuieBlA69OUplRHa5UDZ57QRC/U2+kqt9EcZ18gWwEaEZTU4aI4arMnKbuRdy0C4L5RBYM7K+/dBNO5s0E+A+nxYMnWACZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVR8dvHk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVR8dvHk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3014678689aso3781737a91.0
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 01:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742287955; x=1742892755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
        b=GVR8dvHkdTuvwgFGMkk0ZTWINZuTtvy8dZvXZLU4q8AG3S3Tugp5jwxdIhn10xp5xI
         sGfaZnnkTccnY+IJc+AccQZRUXuhD3Xd5wcmSMj9xVN16cwobnehRp08KWIM13X1o2aq
         eJR0YfLHSCHzqysUYfUpkR9UJ3FPPHOgUtxpx/dI8xWYIZbwBcwOX88nEdyTpseBqlgo
         Qe94dPBMNZPY6wx3v7832Jn/O1/Kjysee9AlYbogHKBskbASremiPBdS6ONxA9QprQc2
         kP7CKJpDGGdBl2aJ96+em7KwKgqH2CMN9jbu4oSD+IqMqsMo22wOIot5jM5gVJbvAzJc
         npAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742287955; x=1742892755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
        b=gosTaylMJKk1WwpYcIQAj33hJj8wKzMrwSfcI2Y+GpQZI06Pc9ms1oLjsGvYXTPafH
         Kkk3jr+unX3gSJlbnRZegUj85/zvjc2ehf0qcNq9ARUIAldj8HikT/FMYHc8aOScDovw
         4Q1h1AQ5dJ6KGvT8g2VVtqz9aVVHqpmXS4o0egBfO//zBoaiDI9FNbHVp0l4+EwryIvC
         53UFuhKEb7swNAxRtswqaWyPQPUxO9aS1lcM+8nMWDWH2Bb5DDaZsZNdSvsWSgDY4UeJ
         xgRroAJ5UrocP3CrrB40C2kIn/fqVL09Zc/sx+hu5bPSxyVhdQG59BTfI2pvfzjob4+L
         1NlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYGSBN7VNtiq7lMRQJCYpof/2snm5qiRqWRjuNbJTOCkEQuuh4dISuSIKAirEhkforyPA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzG7VtHSUsMi9CxiuSQHkd0FYsdCHMYdBqfuljxSOl/D8dcVKvW
	eo22uxugrCTlyguP28mchdWvs8ChE1P+ec7Jn84IU8p2uAFzKnTp/cAYIq9tem+Hw1UtIQhYipf
	omAtcGFKzlA/zy9XEGUWt+i5X1hY=
X-Gm-Gg: ASbGncukjjtukzDnYZuQmXpxOu6TFD0M2mlFM+r0kIB6CLOm+CEzzIJRvniRIzKh64s
	5OeYg71ynxEfOVL5AnbytDSgPQUnpr7d3KnQiFDULnaPQWXZTbqF4WAxuSZm3D45fSVgvEYZQV8
	tICgEh3GtcMEjFIHGVptyvbrGSnt2pslOjMQ==
X-Google-Smtp-Source: AGHT+IHxBtGTYr3jKDOjfudNcmvMSpsoyb/R4JeFGP2QOzJVyaFM9HhxQUDogb4lJVnRc6RbdFlWwMuZrsbX9LPrL68=
X-Received: by 2002:a17:90b:1e49:b0:2ee:e518:c1d8 with SMTP id
 98e67ed59e1d1-301a5bc1823mr1936322a91.30.1742287955176; Tue, 18 Mar 2025
 01:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-2-robh@kernel.org>
In-Reply-To: <20250317232426.952188-2-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 10:54:07 +0200
X-Gm-Features: AQ5f1JqTpuM0NFbEd9b70zQbznVEgiaQyEKWqlPuOjeLEzVp-2Bgl4hMPBt9TEI
Message-ID: <CAEnQRZAwd-e=j2bfHimx9xjQU-2=Anr7fJ_w98t3TAweZY4J8w@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: reserved_mem: Add functions to parse "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 1:24=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
