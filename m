Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB1282E1
	for <imx@lists.linux.dev>; Fri, 16 May 2025 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747384847; cv=none; b=TPnWKV512PsBIrQSb9c9cQ1ihHXN63z9gpMPPr8PmC9RHC0SXbBrAA4xkm1ZnYEr+qYFMwx92KmfYsp0f9W3tS0ZHyy3QJhgCMZ2DGhzX3qQtCp/zVFG/xuGzQAUnCw/F5p1014dcF2mDgf5ZiIBzOwW4ES87p+K0rCLee5nzg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747384847; c=relaxed/simple;
	bh=//TBytdU/dFBQcN/i9wrbTaC/qYS+lOE/+fx0HW/1G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDHh2yWImmZstMLjJfUqo7zrD3NQaiUKWlN+q2vYSNGszfNHNODVNJGCmA1wVJkyqcXtgfcSA/5MVwOmeaZmpZGDxseT07HSKIJXXvulSdo+xIBe3C6wn1z+g/9/JPR0rWeyR69cZPxBQMJGfqLWdUCpnvA01edOmg1VS6gJxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IujwExOF; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IujwExOF"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-879d2e419b9so1693606a12.2
        for <imx@lists.linux.dev>; Fri, 16 May 2025 01:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747384845; x=1747989645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//TBytdU/dFBQcN/i9wrbTaC/qYS+lOE/+fx0HW/1G8=;
        b=IujwExOFhtZyC5Jy8yD0F1wGQY9uw+WhmJRnE+KbHp6Lb2x0GuyCAoLBEDlUtseM7c
         THNK7GU73GNueW18V/RRVW4xi+JUZluEO4zTsDhF2ekqz714G4GY54nl6JWxaxY/J9Ws
         8mdd8ojbo47k94hJbxGeihrCgwjnmR69SLWXp2wxco4USoiQw3HB/mb3pgs0NEjK6TIh
         e+hkvOcGAod9YtUj6m3PAzGO+Zr72VqbqtwDxDHd5gT2khnlDNeFnaF5s73XOswtqsYe
         OLp/yKFTN7ImXFDC6YO99YoWv4Vt/s9v7/gvA7u0K2p5YRiRDBmdMzap2YzmrwGY8fNM
         a6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747384845; x=1747989645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//TBytdU/dFBQcN/i9wrbTaC/qYS+lOE/+fx0HW/1G8=;
        b=aCrB6lOE+3hQ0agMz+Xs9b+KWprgFCmK2OHb9cqGsCSXR+YlYJrhHF7EIzmdqvcUZ7
         96WVPv1BBb2ucl+EZNUakAdE8CjP/0d1k1TMh3ej/R9h0pkdy8pWj7k3tje/z/0BR2xa
         Q02C6SD1DLqyz0PPjrDEj7pBsahuFfmwc/MiAkJAk6nak8qyx50jiJfcyO5WsrclzqVf
         33GMhcliPzBsEWKXfUYGUZZDH0lyAnrIbw9BxzHOZw8loU/t5906nRFFf5LKdPY24qR4
         kubZIorhLRtl7sa4yymFAlo/cwbpu4QpHbCgrNHpCBOqlwzoUKIg7X2DIucYr4ofG2W0
         7sFg==
X-Gm-Message-State: AOJu0YxGRydDbzqpA1b+G7VDFE5TbGEIpjCD3jD1ZKZ2f7IrjhAIOaXj
	O83aKqyZXBzjpUPvubrnZVBv8l14PpXPB0t24pQu6dNl9olcLWJ1tyolHcpJiQQhJZ2We64auMj
	k0iO+spM9RALb3ZlpBaJIPpm+Z65ChAY=
X-Gm-Gg: ASbGnctg55Jk5AGSGQXlUxMlWSlmQWFo7nVSyGFrjNqZVfsdL9aqyO9HgECYdmb7Y69
	m7V1RgD8V8nkDM9YrY2PyKUkRxZ9pBTNgQcoNVhFEFxE+lIBIUTeYEnbWygS7k2uUoSp4z3CZGQ
	iWbYsfxHviWtBIu7w3Vw+ZKdgsbE9Kw6sCqJLnM7kJ
X-Google-Smtp-Source: AGHT+IHgxA2a3btUuwQjoaY67la4kXs/e28ZVlqNFic11+PunnDbXZcjaqYd1P7MCAzG07C9Sexmx/Ys01At2mpMPoI=
X-Received: by 2002:a17:903:41cc:b0:22e:1791:2e5a with SMTP id
 d9443c01a7336-231d459a551mr38620175ad.35.1747384844535; Fri, 16 May 2025
 01:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516035904.GA28759@nxa18884-linux> <20250516073301.3144450-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20250516073301.3144450-1-ruc_gongyuanjun@163.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 May 2025 11:42:32 +0300
X-Gm-Features: AX0GCFs--qHDHT7Me8GogDhbw-j1_QVWESQxrTEgpyWmV4qVUl8GhSPH-nX1xfg
Message-ID: <CAEnQRZAzPx05B7E-pF1QqAZxtF1HcYsMcskjMw9kPbJnk=YU+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Add check to ida_alloc()
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@oss.nxp.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 10:33=E2=80=AFAM Yuanjun Gong <ruc_gongyuanjun@163.=
com> wrote:
>
> Check the return value of ida_alloc() in case it fails.
> This is found by a static checker.

Is it just me or I can't see the Signed-off-by tag here?
