Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E392F12C3
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770059580; cv=none; b=nStBC4V3CrLAse4Y+PbxTg+osksTSaPZtXkmVwJp1HnmQ8qgMJY0+2CGAfe0SqIwS9dxgVOhxJL202InfBU9PmWv5TX/YJvEANir5KHHIzW+kiBq4gZO5aOFqE12da+rLOKd1ftG7iOSwGRkyMqjSPQirlpPVWXc2hZ5HqhoB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770059580; c=relaxed/simple;
	bh=jyjqmYf+LsGP41c2GAP0D20VhnppouPXYV8u5gTUsfM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BeLfvuJNQeAmc9T5xxlVppLtEYLpeYpMgRp/ctzL72xMh0NU396lSPVzixX5V1Hl8nG4ydAMhkv2ulb3Vud7mmjAkycUBceCv1zAOdVmnxOdhomHnIDWpbF4hfCVRxldc3/Lvr6HqoGpJ9rcSwzY/Z1k7P53hN9SWdLpnT167Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=lu1dLrxH; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="lu1dLrxH"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-502a4e3e611so685961cf.0
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 11:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1770059578; x=1770664378; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7uEx9VgfdjgwYROqUMQFza98mDrih8nCYBKA+muYRBQ=;
        b=lu1dLrxHrY5FUMxoZxM0OIBUbtla6eCFyYmx/l9prGLFJVq6hymb50Wz7KGYORB8Hq
         dd49UQP/qiTAcOGeKmOmcs4bu/n7kEr1YMJvnYWfdYuhPeBWBBoHixIEd79Y806if1y2
         WiV2JIEAtOqQNt0RP4zvbaDH2RTx6NyQxogvFQaQdQIeXgZuUpGO0gIK7MxnE3S0QSxw
         nhvIESQVD35Sc3RTtcpI1asWBR/pt0IkhkV6P7kPuUH8aioDE1KGWP4t6Lk78AzgmQ4w
         Vmpr7G1jbZRCI8JKHmGyZw/HgprvmcE4c6b/ZSXTA+111QheUWO1lCJSk6sackKBO2he
         rYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770059578; x=1770664378;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uEx9VgfdjgwYROqUMQFza98mDrih8nCYBKA+muYRBQ=;
        b=M0qd2eBEqN1/kO/kZ4Z4IXHBmwOpPOw5e3CtkhViHnBBUMnuIvUrkLCWVdBj0qM8Ie
         Xm6XsmZzRB6GgYS4t6ZxCtulqUjRPLBMPEG9o+6mj/jPOCTZVaiXIPtkE+Eypd9jjBBL
         oa+M7tW/gmnfGp8k0IxfOaTVuW4LNvjXwAVeCvKUP/9mFNPC9cBaRCJWVvdk6edlnYjS
         5AjlXjJeACpdzI7G2qt0kSjVd610ZvwKO5doJKPwded8LKg5qMx+2Y9183509cZxojRc
         ySpjzx8hNsoFAgtC2gARJmdcagFeba1f5VweX9kxcbhmiYEgoN28MihPAsJUyVoWq8vY
         Pfdg==
X-Forwarded-Encrypted: i=1; AJvYcCVkAn6KZloBCqPwCY72S5eehzyLha7/EiKbzXW2YMbGrEViQchNaNPnIQ6sqAPICcZGcf8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxs79NcvWGjVVNas9G/CxxrUoCPb8KOnfLutU1bYcePqcqjMRn
	8DXRcro5QH+UPGnJa01z2wRIgMjod7mHK5mfggTn0XKVhdxMeuTFy3nJQRO+BtIUQsk=
X-Gm-Gg: AZuq6aKWpuG/AeIZxLFZFfOVM+4KRRUFwY+AlP8utGxrU9tz0hXFq5ykdqS6XhharO8
	hTD+iERbHVRE3lnXHtFUQcr9rmitLfga5JrtR61ayZ75KO3m5XuOnR5OmV0a/l2rdzB1K4Ja0XX
	Pw3qaYauUbF+bZXn1t/wGek9FXsGN33LB1dUIusGkgE+plXg/RxBZTG0siTJWh/tqZdro++4C+g
	mGE1m+bhBOfLQ1et3HoIZrnnsbCtUBFTSQwUYLlXWYJKdktkH0sgLyphd+F5usby4dpD8S151M1
	lv9a3Uk7BRMJMzyQ258dpfM2BZbKPz+ZCkIV0NqbPfUF7caBQ5VMr/sKYs5I0fLusJ3Hp8XJjdr
	P75zLypOpKLBnun3TIYo3yXofr+qXpQspnVU5PKY6/TNcqiWjGmCjKDdlp9Jd1eKRNBjv7FpCgs
	UB9+f+amg4K/A6xZmW
X-Received: by 2002:ac8:5fd6:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-506092c7e40mr6181511cf.25.1770059578134;
        Mon, 02 Feb 2026 11:12:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337ba3997sm110411631cf.17.2026.02.02.11.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:12:56 -0800 (PST)
Message-ID: <5e3431c69da07557edb20a252c4759be8c857f08.camel@ndufresne.ca>
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for
 4K60fps decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de,
 sebastian.fricke@collabora.com, 	shawnguo@kernel.org,
 ulf.hansson@linaro.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 02 Feb 2026 14:12:54 -0500
In-Reply-To: <169eba79e8e1f906b1a0b59e22a531dfc7e57a1f.camel@ndufresne.ca>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
		 <df8d5d5f28870752e77ec74f34fea7ceb6e97286.camel@ndufresne.ca>
		 <0b24716b-438c-4185-8a93-3a3879147c24@oss.nxp.com>
	 <169eba79e8e1f906b1a0b59e22a531dfc7e57a1f.camel@ndufresne.ca>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LAOjFPzcyPbpnKVdmA5V"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-LAOjFPzcyPbpnKVdmA5V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 13:44 -0500, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> > This doesn't sound like just a VPU issue; it's related to the display o=
r=20
> > DDR.
> > If not displayed, do the fluster test cases yield different results at=
=20
> > 600MHz and 300MHz?
>=20
> Didn't you run these tests before sending ? I can try again, but in my
> internal
> notes, I wrote:
>=20
> =C2=A0 > Tested that, and everything becomes unstable
>=20
> That was before I figure-out the IRQ handler didn't handle exception bits=
 that
> didn't stop the decoder (or dry IRQ, which strangely is common from the G=
2).

Ran some fluster tests now. With this patch the results is not consistent
anymore. Then I ran it with weston being started, and in the middle of the =
test
the display turned black. Matches my past observation. We did reproduce thi=
s on
BSP kernel too. When the display goes black, the recent hantro drivers repo=
rts:

[  827.581586] hantro-vpu 38310000.video-codec: frame decode timed out.
[  827.720201] hantro-vpu 38310000.video-codec: not all macroblocks were
decoded.


I have local patches to reduce the cascade of errors, so it likely survived
longer then last time. I will send these patches soon. The "not all macrobl=
ocks
were decoded." is triggered by a bit in the status register that is not
documented in NXP TRM. I found that bit in some VC8000D documentation (the
sucessor of G2). I concluded it was the same meaning after looking at the f=
ailed
buffer visually, it is indeed missing couple of macroblocks near th end. Ea=
ch
time we see this error, the DCSS gives up and turn either black, or sometim=
es
other color. The second case has been tracked to a DCSS Scaler underrun, th=
e
first we don't know.

Fluster command ran (two threads, never completes):

./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-HEVC_V1 -j2 -t=
90

Nicolas

--=-LAOjFPzcyPbpnKVdmA5V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYD3NgAKCRDZQZRRKWBy
9IfHAP4rQUDUDbBIhNcS34h3qHt/x8THSc1WpgWBmUlwFmTckgEAs9XuoGSBAa2w
7zD1Mvo6hkReZD5SmiJWAnGAjRbhvQ4=
=BWBL
-----END PGP SIGNATURE-----

--=-LAOjFPzcyPbpnKVdmA5V--
