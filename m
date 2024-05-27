Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB04C8B
	for <imx@lists.linux.dev>; Mon, 27 May 2024 03:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716781507; cv=none; b=uDTNZ/dHWXDLmnqpeyLJ+GZCA3Bpgh6N+pyyp6pSUUqDcRpyRSFYvkuSa7j4tnv3nmldHk2hPTXkFqR6t0Q6unSjA9CbOcFVLhSfvTCeuZfnv3FVUETfmAAJLQjkGID+Kn22hrYoI8I3tTEhrNOE+Zvu589muVmMt+wlsO/gvfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716781507; c=relaxed/simple;
	bh=tCjs5Eba84WyRbeea3rCmX7AOf6IYq26s/todap2UFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhOlLnNvzf0Y9cWCujj9L3rmsMLohqE9Mtx3+mddxTF7w8aZYOOZowmHD+m0esa8ti2HM+2VN2DkWpH8yJYn+tUPgbcENMcuvdVNeCSHgC3j+XY6nLzqhVewtHHTcbG/xqzXPi6HXyuxeGEBK3XG8BSvWLE41T/fHfDhazPCG1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itWVc/X1; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itWVc/X1"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-36dd215b965so37796075ab.1
        for <imx@lists.linux.dev>; Sun, 26 May 2024 20:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716781505; x=1717386305; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxnEZqeiz6E5KfZch5QPrkG1bRqZFA0h6HtEP1on5fs=;
        b=itWVc/X12JX9qUzjCcj5A02kHfjy8l4Lm6XZnOXEbzW2oNRBYbjzka+znwC3V3+G1u
         8Me0bFWcKsXHmv62UfAzAJdbeJfLgDLxHNpAa5X+Sk5aIo8d1BYfE2MpyLkX8jtrIuOA
         fJqkJn850GUxQ6ws9BSplILlkn+isGHgwUdBZcq45kNkx63pXWBQtZ0Yp4e4r7N1aY0r
         Y7WmNECEK5HG5fM0jimGCrVAq4oLwPJhs0iYD17JbqkuNlg1GfyVUpyk/nDMmMn8hiOw
         bZbALLGrQukLaCgD4yWQCtAO3p6hwh4ij4nLO8z1CwHF/UcUSMHSVwomxj62V3WhoB3C
         UptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716781505; x=1717386305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxnEZqeiz6E5KfZch5QPrkG1bRqZFA0h6HtEP1on5fs=;
        b=nmi5iPVzyeM5Jots47rszHxdZlKO4o2pnXqOCADEH2kdhUoP08wXZNtWsQR0sTufYN
         AmBIbdwfi2wjtkNW91iaOZBsxr85Sq0A7BypbqCa01qhHLSIifmsfp6Laq/UHCBJZ5OA
         Ql+QPtNNT8HEsS917UcQH7pC7VUtcrrCO+4tqNV43nndZlEHFZsBWLe4q8Fs5FRmY++6
         f7g3McdKW73DQZhYOXiazgQ4Si1tPdWJhlXDXdRuaBEt3IV+35KWSOPbQn8/B8OUOC3J
         n7+eN8XZkOf4TpnSbsN1+lSAC9OVcKhRKz2KYDMiwZ89OjYfCK8kz516uIRu2pfEEb0D
         ClbA==
X-Forwarded-Encrypted: i=1; AJvYcCUHmf0mTGsl8Zp71QXOu3ijvIIbiDPt6SN5zmX/IIFu/aao4b6cW+s36z0DToa3L37mjsNweYDCyQzrTYLyI48XOmU5
X-Gm-Message-State: AOJu0YxV1oS/SIJVUaTYENQFo4+JR0a0VQ3h+f6yt46JLIR7R4xweTGQ
	INqt9e4B4vAs+lbGZ6zYvHIZEcaXM9OtJd6uJ9ffGIpcspIEqmXPZDceVlbvIp7+oDNlRni8PX/
	guOmZ52vxbJafUCG+cJdIMYTD5gA=
X-Google-Smtp-Source: AGHT+IEQ5Inmp3v++358a6lbXEUkviSYZMCbFiCuAWuQtWjhewWpE404nqkXbPrvEpGYJ+8RcolCNtdpyxh58qpeWP0=
X-Received: by 2002:a05:6e02:1d99:b0:373:8e8d:58e6 with SMTP id
 e9e14a558f8ab-3738e8d5b18mr56635485ab.6.1716781504763; Sun, 26 May 2024
 20:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1716458390-20120-6-git-send-email-shengjiu.wang@nxp.com> <9fe12ecc-c4c2-4adb-a62c-4c8fe91b6613@web.de>
In-Reply-To: <9fe12ecc-c4c2-4adb-a62c-4c8fe91b6613@web.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 27 May 2024 11:44:53 +0800
Message-ID: <CAA+D8AONWV7Msf=FbGa33ukkMLpySH+AZgO8B2O3fz8fhpJ5Kg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] clk: imx: clk-audiomix: Corrent parent clock for
 earc_phy and audpll
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, imx@lists.linux.dev, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 3:55=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > According to Reference Manual of i.MX8MP
> > The parent clock of "earc_phy" is "sai_pll_out_div2",
> > The parent clock of "audpll" is "osc_24m".
> =E2=80=A6
> > Fixes: 6cd95f7b151c ("clk: imx: imx8mp: Add audiomix block control")
>
> Does such information indicate that the word =E2=80=9CCorrect=E2=80=9D wo=
uld be more appropriate
> (instead of =E2=80=9CCorrent=E2=80=9D) in the summary phrase?

Yes,  thanks for pointing out the typo.

best regards
Shengjiu Wang

>
> Regards,
> Markus
