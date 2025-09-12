Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A74A1E32B7
	for <imx@lists.linux.dev>; Fri, 12 Sep 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681209; cv=none; b=i80IKI7pNQJw8P3urk/cQ5yQs2JMbLAnMjvogZw+BGeyFs4LX58JlbeGGpCifgTv1PkzvermhltkmZCctlBxKXKCHVSTGYy6aLowV+dMI8ANXdtGkRmyUQH0niH4G7zKu1oLGpiQpeQlp9tAhrErksEQLAoV20DxxFA6hbnniaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681209; c=relaxed/simple;
	bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu94wYl6pVqOFTfztbqf4RBpeoMnQxenCaVVKzC7ywflhSeQ89WBcZAadTvwWFrkWpzN7xldB7bya5ZNsgmTxjKTYNNIMHoePI78rv/istWjlZaB+Am59iHvpjl6cNNJqS+N9CvwN+BSe1iDhEy3YzYlU9fDMRWXlwha5DITCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BwXvQZ8N; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BwXvQZ8N"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336b071e806so17101281fa.1
        for <imx@lists.linux.dev>; Fri, 12 Sep 2025 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757681205; x=1758286005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=BwXvQZ8N6QbDOnvfjc4j+yGXPMWrnAHDdrpIRKbKG3nqCcTKFzygUDwEUZR1VovSm0
         iBnx+jdEHx3d+Q1MrSX9E6onFXV79x/W+62v6IzgGYybTGgfqtkj6rpuLmAM0C8UuPWN
         Fb3q60K2vb0KIasxyK63FgAftk8A1NNDWM3m52hlIa7t6muPoKlJirf40bbiOTWL+aqu
         FAyPemtGlQGRteFrnMgxSdrMGBQ4NZNEcRg+e48CDCuqLmPblvU5zrljiiamTZCsIjMW
         D8PjkT7vGH645Wp4xErCIo7wCU4DuF+1g/O85ZuSqTL1SDUjxqfeU830PXe/7K4I/CXa
         wCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681205; x=1758286005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=hsk3SsctBh+9z7i/Zi4eKupZ9MZin5GWeSc2su9Bw5isviczsvcbQyAEwrG6L10w/F
         t1iTHni0cVxQvzu3y2RWTH6rePpyWHqDv9xSpsJL/TM+WqJLAUfk6AdX9RbNOx4zzyGb
         i8L3dOr6HUPCTX3O2sjC+5wpLQz1pJUZsIkNiKmC+8/s6EFe+mzaaunnM/bUsvU1pJwP
         plPgAnUk2VjK9ckZPz2ZhjnzRL7rvvGhkNypN73cX10lTGVPJ/sZh2u1CoT8Iz5cgkF3
         vZAyKNIcbviWdfAKyiXvGQ09H46VUTmdA3rExnRGR/uPaTq/vWgJpmLEjXskmuZCaVqw
         1eKw==
X-Forwarded-Encrypted: i=1; AJvYcCXO7kbvet6bWu72fzeM0mdFt6rpe22ulcH25P5dsyL2HU5WeOLEbvKI//SCn69f+niJrbo=@lists.linux.dev
X-Gm-Message-State: AOJu0YznlasaCb8xvgnDNieLf8MsGv46x3OJfI8351vs8scgFJG6LSeL
	Rl4qOTlrnlarwBiab395KYXRqZ/ZcIX6tS5BfpBuIwRAepwo8VHbSbiJL+cRgy+PJHz4KKkczsa
	2gMuoBQbWQmuQ14c4Xxomt3uJPTYUocVpmChkNrcEmXTMH8QhAM7CA2s=
X-Gm-Gg: ASbGncvtKKARSQWBnnH4hcgN1gPMsFRteh4CfAr4sqVEiia55qw77jQvr+Je+5fBI0R
	wFP016V340QqKaXeXwXtliXgsLS0RMh0UX/vqhAm9CS85+tQGwAgPr6duu5xcIAq1u5jdQFTXoN
	1UTJGtFIiqandc7vZML+wS9QDUdYnAFxuskwEjrUzmqAEDDQ/acYxPqF3fvsjtenZjys98kDsg1
	+qblF8=
X-Google-Smtp-Source: AGHT+IFceSrS+iukkr/XkXsYJuXAC3/mzUt2kTyPUu5TFhzIuaRO7o+4f66lybawSyOyyY1O0N/R5wKHhfBQZAMqWCU=
X-Received: by 2002:a05:651c:23c5:20b0:339:1b54:b367 with SMTP id
 38308e7fff4ca-3513b296a39mr5927901fa.18.1757681205355; Fri, 12 Sep 2025
 05:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
 <640041197.22387.1757536385810.JavaMail.zimbra@nod.at> <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
In-Reply-To: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:46:31 +0200
X-Gm-Features: Ac12FXysdXrp8ARxlqs--JPKzGSESzQlXQvRlkFB3ZYER3az5tDF4P1ySurKojc
Message-ID: <CACRpkdY9VS1H642wSUsLvwi91YOwXGkiePdq+JktDSeiWTon8w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Weinberger <richard@nod.at>, Dave Hansen <dave@sr71.net>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lucas Stach <l.stach@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Wed, Sep 10, 2025, at 22:33, Richard Weinberger wrote:
> > ----- Urspr=C3=BCngliche Mail -----
> >> Von: "Dave Hansen" <dave@sr71.net>
> >>> Even with a new memory split, which could utilize most of the
> >>> available memory, I expect there to be issues with various
> >>> applications and FPGA device drivers.
>
> I also remember driver problems on older Marvell NAS systems, which
> we never fully figured out, my best guess in retrospect is that these
> had devices with DMA address restrictions, and if lowmem is small
> enough it would always work, but any lowmem allocation above the
> hardware DMA address limit would cause data corruption.

This kind of mess is often also driver problems, in the Kirkwood MMC
driver there is some dated code traversing sglists iteratively
instead of using sg_miter() on !DMA which I think is not entirely
safe either.

I wanted to fix that driver but the hardware is in my NAS and
all the time someone is watching a movie from it :D

Yours,
Linus Walleij
