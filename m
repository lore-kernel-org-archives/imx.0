Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0D144C4E2
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168133; cv=none; b=lKzpEhkQrNwN7FAmXiBNeJ7IuWGlYJSeSGE8Kk5XllEJoYpJpxCu49mWRFcLcpOLcW35Upv9+tHTp5DnoiO72Y4+R6wLJzoqIWAWYTIDpL+ZVh0s7thSnIXg0Q0GcryC0Nw2CconkOpEQCeohgnD+dnfWbilDBAkMhVpIeC6XCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168133; c=relaxed/simple;
	bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GePgIXtyfiNhft24dNoJdew1FDjfZg9QV8bZK40gM+rdpbs/1l1QgG0GeSb4tKqq26SKvJhIe2VP4onMhyb13XFjhncFewRDaB8qzTQKEIRYUkWNc3G30LawwKKC5mi7gl3aSF7S2EHCDbjDI76Rcxr7gBhkIOezkJKuuTn1o0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dnvPac6Y; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dnvPac6Y"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso6666615e9.3
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790168129; x=1790772929; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
        b=dnvPac6YqpGkNhFtx4Arwq2IUl8ECuWrzVk+ZVwLogIfgYuf4Ly2e9+AgM4y/dzz/h
         wwPqb6vSos2DnI2tUjre0NdeoZ92DhRS5S/gMj306m+f4f+OBUzLDn/Xi+KxaY1yZetC
         btI2wCDqXfsfeoMsLI7CRiCyuclPuQmYxEkAxJid6n7tsHYbvLnOZzkVa/vSKqY9HGg4
         2TW/8wmsLdSiq2+yE7WvDt3mA5fZ169ZAfLAtKlPH+o+r25qQrHCJRbu9mA4BvE1sbma
         dtrlRNfmrLMxCMCL03xOiaK/sLhZiDPgOhlGZpv9RO/uQCKvnyRPfHTO5ceFm8aeD3du
         ipxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168129; x=1790772929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
        b=egiI3OvzpSohnTG+4uurYt0K0cVud3b4pslDDz8f27ogIqhgOEDf4p0bjgZrNpJfSY
         UxsXnkj4eCqPjqq3RlQ9YiitKQOGhfitjsbSfhyq5OVeg6Rj6aetlO5OYjv+vcsxaD7M
         JsJSaDSXiL7/bNMfcXqfDUXyrDDG4CzBb3wNRfjUWAkeSYRCmlYdgI7mSQ1VZt1r5m3I
         fmo2yQerwo5GZ2pdfyRTconOGe1ezTattbW9hKt6/eUCK09wfKqt4cS9yhW9R2WSArhb
         JcRZAeI1rFdg10X8jPLXMPCiCNTQ4GFBMp37I077mGNUntBVqOoX5NNzdTzD3pIETMuP
         9zQg==
X-Forwarded-Encrypted: i=1; AKwUvByRIVNfSdNh5WzRC061RI3G0wXNAnZ98svsvOLlWywMBhFOe/i3sX1Jl8B0i9KhG3R1C1c=@lists.linux.dev
X-Gm-Message-State: AFuF++kS2AnIiqrIqVBGj/Sx4rfa3gyHHTEhueZjO8C5GP4nBsPYjToK
	TmShgIOhOFHTB2MXlu0iv2//BJKvj4aU7n+Rp/8r+YfvKUmMG98a5uV71rikdc+PQRA=
X-Gm-Gg: AYBFou28CiUFHDBOQc9bLD+2BUufXk2WwC12f85tL8wKEWhCHtuGnhR3r85zj1j5I3c
	E1PSFfOYAv4BDL124Q1mFS4zZtiLiSW+EEMC3awSDjbt7SjPaF+uI/e1IJyNfPPDU8KpnmFISBm
	jopn99/Xau8sGtA407e1pD20voZfX8NcMJVHfy+rtZ/lCTFcEWsQjxlRr0bwy2Jq75yDj1//Ntd
	YUHIrwBDZtCJIx2z2t8xelzF0WDnhD+OVEh70Df4JKO14S2YZbyRreFr6Kw3Zl3CwZQq3j4PJoO
	NmcN/7bSg/TfuuRZ4XeAoKb7ctNPDl1iHF4fadPX635AL77Vhsz2GTKbUTqGZMfwZShMGfcF3UJ
	eQ8xWHIWIEjIiGOMboyk5Ua8Oy9y97HdGmlkjVRwBp+RRiwdwshKqwbD8dclxuwnAg8kECijyIJ
	/7TZMJhD3QRURMcdlDETYAB5YF9hohqMnpXabyDlr7ArQi0j5PoOlp4hy4m6Pcx//aepcdyrY0I
	uR5gyZUraRUcHFQOER9LDa3cq3xEoyvvtCZLJOMRR+0XHsEjOsIMsxtk9cR
X-Received: by 2002:a05:600c:4505:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fdf1578a7mr31453415e9.32.1790168128729;
        Wed, 23 Sep 2026 05:55:28 -0700 (PDT)
Received: from localhost (p200300f65f19a9046bef90cd97470407.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6bef:90cd:9747:407])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fde1c159esm84444015e9.4.2026.09.23.05.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:55:27 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:55:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <arPMAXs4jjUeu1DE@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p23qdzzba3kphtno"
Content-Disposition: inline
In-Reply-To: <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>


--p23qdzzba3kphtno
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
> If Uwe is fine, yes I can take v7 as is.

Fine for me.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

The nice thing is that the device_id structs are not API, so this can
also be addressed later if someone comes up with a clever idea how to
implement it.

Best regards
Uwe

--p23qdzzba3kphtno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqzzDsACgkQj4D7WH0S
/k6svggAp6Jdfc+Xv2nUfAqFVfbCWZPZ88qKW1qMOteW0gWpuiaNHYYP2davG6FM
Wm9f4BcMIVB5SEWCvqqMT+zvwMxy8614yA4/sd756UX1mJZDA/nvw8+ZkMPnkXNa
IBp2GTVwH1XF7O91KL9nZCsC52taJ7wE2yrBojLRNEB/+KIw164n7lbXO3XrBIoE
h0QLxyatblxOchoALTVDIFb9u664jBtlTFzDKepLyyGaeHbSBk+RJ8Uz/v8ls3Kd
3fFPADN4IEJAnHIDOCExNdpreKhCW/1aRhZf5YZJX300ZH3x59s8UKvsg2iYEzm6
BGRNNyDjN4kR+bqzxKfXqWs9TXUpFg==
=Uvoh
-----END PGP SIGNATURE-----

--p23qdzzba3kphtno--
