Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF92133030F;
	Sat, 11 Apr 2026 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775904046; cv=none; b=ImYId5czQN8FbryFXAF/o3Hlz8NgrcpH8r1DvNdcZZ7Zp643zdqumWyFY5WVdyFEE6bcm+FvlxYsIOfeuxLEMEDQVi0QTN26sLw2KUnJQcAW5UWNXGtEPolh/CDyE32N58ViLNDf3/2Ymc8aJv96ezAl8FRZsDi4cQvg3x6FsIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775904046; c=relaxed/simple;
	bh=61nevb5U7KmJ6GlJeZz+DxBkLNyhcBVs6JVbc3G0hRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyRdy8z0amBbwb92G5LNw7lP5MRoa+A+zNow6DIX9wTBfak5f3sHynzrEQkyeNVQP818WlS91LC5o0FhJJK9NhQGJc4Z3kk2gduq3wbW8sDzccIokyjHn6laRwmefqFJfQoqUgY9PquLZALLOuiJkwsdu//83AN5jLYiNYykbcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgWv0wKF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgWv0wKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D47C4CEF7;
	Sat, 11 Apr 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775904046;
	bh=61nevb5U7KmJ6GlJeZz+DxBkLNyhcBVs6JVbc3G0hRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgWv0wKFO9krr6M6Xkfs3b5boJvhz+IUUDY0knPmrLlxJEZBCNqIuOkKZ6lrlwW3i
	 1voGar9s5isgNb59sAJNBA0QLDA7P5P7aCIuRXGkrWxLETW+rhU43ymy1obXU+E4Hu
	 vQ07EBaeeNjo7j4d8wLCqPYNLj3o1HC7jiquV46Ek/wnhCQGp83SIcc15t+JASGQaU
	 AhnMsrN3qenIbfjRucmJxp2NKncOBNWR0rTZF0sRRfRgl95VPp+680nHHFqwslAmIa
	 8HzIV0MPc0a/6MuwY1cmPHOL18xYgHV7X7+KLeG9cpIiToYISm6sbgtMq83EEgEOYF
	 Me/AkfacOtr6w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6F6A01AC58BA; Sat, 11 Apr 2026 11:40:42 +0100 (BST)
Date: Sat, 11 Apr 2026 11:40:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: imx-rpmsg: Fix ignore-suspend-widgets only applied
 to codec DAPM
Message-ID: <adolKj26DFqZ-XTi@sirena.co.uk>
References: <20260411072439.1125664-1-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wxo/GoZ8NwX6CkGC"
Content-Disposition: inline
In-Reply-To: <20260411072439.1125664-1-chancel.liu@nxp.com>
X-Cookie: You will be divorced within a year.


--Wxo/GoZ8NwX6CkGC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 11, 2026 at 04:24:39PM +0900, Chancel Liu wrote:
> Currently the property "ignore-suspend-widgets" are applied only to the
> codec's DAPM context. However, some widgets listed in the property
> (e.g. "Headphone Jack") belong to card or CPU DAI DAPM context.

> Extend the handling so that widgets which are marked ignoring suspend
> are looked up across all widgets in the card.

> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c

> +		num_widgets = of_property_count_strings(data->card.dev->of_node,
> +							"ignore-suspend-widgets");

Don't we get an error code back if the property doesn't exist at all?

> +		for_each_card_widgets(card, w) {
> +			for (i = 0; i < num_widgets; i++) {
> +				of_property_read_string_index(data->card.dev->of_node,
> +							      "ignore-suspend-widgets",
> +							      i, &widgets);
> +				if (!strcmp(w->name, widgets)) {
> +					ret = snd_soc_dapm_ignore_suspend(w->dapm, widgets);
> +					if (ret) {
> +						dev_err(dev, "failed to find ignore suspend widgets\n");
> +						return ret;
> +					}
> +				}
> +			}
> +		}

This seems like the wrong level to implement this search, it should be
in the core.  I'm also not seeing any prefix handling, the widget name
might've been prefixed at runtime.

--Wxo/GoZ8NwX6CkGC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnaJPoACgkQJNaLcl1U
h9C79Af9Eww5MqUM4l2uWRZsMS1+DeTVXwJPdg7NgJgCOgzNWNI6hP6w9WE8X1BG
Ulvj0GOSZy7HDwLahBChs8AydyTxc1qaR7qNljsVj0Bb7zJmVIkHa8nuqtGxsDux
nvwnyybQFXambSXYfK4rbsUrF1XZ03NYnV5QroMIa3GsfyFsdK2otKJv5SNmgT82
pG2VFlhxxd/uocwyG5CqWxj0bTija2Qf0mlmbJMb971kafdmhRUWLFuC8FKxKnTr
POxLHJO4V3G5SbdvtZDMYqLLAn3psbWCPIkMXMy5krUPef/qh+wCVAwMapMnpWsV
WOjblDfXWqT7+DwxsSH8yOpoGJ+d9w==
=Y0Br
-----END PGP SIGNATURE-----

--Wxo/GoZ8NwX6CkGC--
