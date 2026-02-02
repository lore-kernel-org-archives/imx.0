Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2836C0CD
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770041843; cv=pass; b=GmgDwtzgaQBuXn71q9wwakCO0hyWL8RwQANNIZNVc49Hy+a14dqd/jmbfhT5V1NnpFvmkP665pxUpik0NAh168ggBZtvsi2L3y9mnXhflGmHxsHmfDorXlR9hrK6irB4AQv2KJaJVVB2xNjW2uqr9BrSGF9kyYaF6PI2aC2onjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770041843; c=relaxed/simple;
	bh=8kTR9QPGFqxQjrlyBR2RFv6GOSbe116yVA/R+TPaP8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdQyWmE+bEI4K3TTkZkeFJgn2WZ4rOYvLuzwxZ8EwO2/Mw1A49waTEz/tCxinXVgiWZjY89fkHSkuoYqFpBJShW6SGATqdg45DIpVD9+rL03MR+lgq1lbCcwPzcFwaO7k0ZGwTsjkXAZndBCzsqSa0sR7fnXLy6zScDs9Y3OBBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoIqgiHm; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoIqgiHm"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso1726972a12.3
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 06:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770041842; cv=none;
        d=google.com; s=arc-20240605;
        b=a6Cd/u3n9m05Hu/batFsiLPAydnClyspOrY8FnJLQD10IpShGyUQtZXy9cA1s7ex9w
         +V5+usbKA+OwvoufRHhU/CSzu9s04HfKwLM6KOsG5gjykcj0QuijKd8Gmm3Txte+KZr9
         vo52XOZ16GVv8I4n4ROMW8oyfNcJZsAxjZ5HaxjR5Ul4N3rMtkyMq+9wobqj8k/xmDaF
         BxzkJfNYvrSaH8Ky349Jh/r86scEXrWGtHaRRbx22uakXaA7kEoVL/eMbn1OIBsL1sUU
         oqqPB8MYgV7r1pMNA7cKNuZ9fxNsCW+wluAi1kSB56SSgoycqM276gBM3AaGSviZly5r
         LIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        fh=2YNrARgzM8jDyOXHzNSGS3TIYQmYwC6VhoydTPQLxx4=;
        b=C7+xMKL/rBVbs/67WtAeROzzpno5pfxVqGScUq3bPWDTBiFg8GZCLaygWKCA9bd66A
         Ioe7aypkKpW5nH8OGnfQ93w8hoBquSACL5tqxoA0TXM17ZvKHPDn8pv263jOzESfiCIJ
         1v77LH0Mwa5P2lL17R+TNK9yyc9I3NYJSrlxWJO3QGLnAyDCaaX9/8PlunaTLYwVAxlj
         ub/kbqhlXSchql+FYQPv1nP6/zQGm5tQIdH+JRDBHZjmB1LrfDKawrrC3Zbd4m+cL/lA
         i2jlb4JMuMxPtnDlJK/trPsWeklDctZIe6D55OqAKKynLDUtek0egt+5nEXlNTT0Aupm
         o/ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770041842; x=1770646642; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        b=PoIqgiHm76QnggUGJ1TM6WyJqGFp2dAsTTVmSYJ3pwKO6GP9bsKkwUYI1tWOxP5df+
         Hts7Jh//muasDXfu7UpTZm9YNhBuEO4Jdp/giNE+EGiQtUoNowTtk0JEL+t5df7e8mLy
         IMaNa8FLITg2olvV4mlT5/HT7yw2DrU2p4cdnIdSTCFC4Uk2l7av5DluheZ9YKKjiWiB
         j+weuKEPLFCgc9zO8Df7GiZZ5iX8V/wIxtLcQFb9Ha1/SD1W4LENCuKsZcJ4VZbXHe2G
         ZBj8ZrV1JNHiPzLgLGMh947PtHxX/oIByBT15RefTVkoZviu2slXt+JuvYwCSLwEcKPZ
         baDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770041842; x=1770646642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        b=ua/quOT/+7IQy1V96LvVkyWg/EAeZNcVwMvgsEuGgULASm8n9WSUe89xUydvsCAk5O
         7w0pikhzN2Yu7QF6gv/6sCsnAjY913DQxOXtuxld7TKNdXOFAkuXGQ4D96Oc+cM/7pVO
         AMC0C7AK1OfpRizHtaSRQhUcZu8Iwez4NfLcltJ4Kn/oNiD5t9d6BcADcJ98m1QE41rH
         2fIVbnyqD+5/AKFnYWsuImNzrO4MVboAuujQOiw9Ow5aAaXOraW6FJMlH61yDXQQNu/K
         B9upx53nni7zb8UGXDzd8fju4jFD3TCmd8sbn28o3B37EVXkrYcDhDc6tjHA2LlA+UbQ
         n0Gw==
X-Forwarded-Encrypted: i=1; AJvYcCX8nL/CgWx+ET/PhY5a/dhkVLKQrsc//6Ck8HCKT6kGq8UW9LgTYjaVQZCAxilgFJGXKYs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9c9777kA/rypWgzXjnEzDVU98Ff50F3Ywy2WKmFTMwAm+uIFA
	kW819FSU8nQaj5IiC9nz+wsowJ9XLTSVeuQvTCChzX46vmwVHHO7q9TXPtOhllLDualYry/rsYb
	v4rVPmofOq20xmMiJj7H7OuZKQ4tVMZw=
X-Gm-Gg: AZuq6aI1XGBHbshOH8LTwPa5uSzHcyFG1aMA2fetmgzHDjbTViwzdTOl4H3n2hrLLHo
	QZtO83K0JUteGNToFIpDACbbtTUDbWNGSttJMpSATjMocdpkDpFLExxfW4QyILlxfbfeNDwSV4K
	HMh7zvs80DfChfckCRDaX9xNREFCuhu5GXilqyn77u3sFFsXSMcynNMVs+cBP5XqmyFf+C30o74
	RBJRWDrbB0bqBtDU98F9wDnjbJiC6n5O7zKU5e5ZPArYY1MA/CIfAWJt9WgyKy56WJdnKuCZVdv
	nnw=
X-Received: by 2002:a17:90b:5145:b0:34a:9d9a:3f67 with SMTP id
 98e67ed59e1d1-3543b3eff19mr11142088a91.33.1770041841526; Mon, 02 Feb 2026
 06:17:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
 <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com> <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
 <aYAGMAE7ppXP/lbR@shlinux89>
In-Reply-To: <aYAGMAE7ppXP/lbR@shlinux89>
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 2 Feb 2026 22:17:11 +0800
X-Gm-Features: AZwV_QhoCxlCzLAcnWkBO4ogn0VW2M6mcHRnmBpiFBphn4q3UInMNacf8_hKx4Q
Message-ID: <CAN4SLj3AaM8qiS=DefEWT=EZKQJ6MVa2zEFhU4vgpJZzDBFq7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Akshay Bhat <akshay.bhat@timesys.com>, 
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 10:03=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Sat, Jan 31, 2026 at 11:16:57AM -0500, Frank Li wrote:
> >On Sat, Jan 31, 2026 at 04:11:34PM +0800, Felix Gu wrote:
> >> The function pll6_bypassed() calls of_parse_phandle_with_args()
> >> but never calls of_node_put() to release the reference, causing
> >> a memory leak.
> >>
> >> Fix this by adding proper cleanup calls on all exit paths.
> >>
> >> Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> >> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> >> ---
> >>  drivers/clk/imx/clk-imx6q.c | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> >> index bf4c1d9c9928..1d8e8f0891a3 100644
> >> --- a/drivers/clk/imx/clk-imx6q.c
> >> +++ b/drivers/clk/imx/clk-imx6q.c
> >> @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *nod=
e)
> >>                      return false;
> >>
>
> One more comment:
> Put one line here, "of_node_put", no need duplicate it in below.
Hi Peng,
Thanks for your review.
Frank also mentioned this in V1, but I think it may not be good to use
clkspec.np after calling of_node_put().

Best regards,
Felix Gu
>
> >>              if (clkspec.np =3D=3D node &&
> >> -                clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS)
> >> +                clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS) {
> >> +                    of_node_put(clkspec.np);
>
> Drop this change
>
> >>                      break;
> >> +            }
> >> +            of_node_put(clkspec.np);
>
> Ditto.
>
> Regards,
> Peng
>
> >>      }
> >>
> >>      /* PLL6 bypass is not part of the assigned clock list */
> >> @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node=
)
> >>      ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents"=
,
> >>                                       "#clock-cells", index, &clkspec)=
;
> >>
> >
> >If ret is err, clkspec will not touched. So clkspec.np keep old value,
> >of_node_put(clkspec.np) will put twice for previous np.
> >
> >So need add if (ret) check here. Or use difference variable clkspec with
> >init 0.
> >
> >Frank
> >
> >> +    of_node_put(clkspec.np);
> >>      if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >>              return true;
> >>
> >>
> >> --
> >> 2.43.0
> >>
