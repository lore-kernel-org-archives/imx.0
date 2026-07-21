Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88510442FAC
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626151; cv=none; b=GFeYBGU5DwsOgc5VXsrhvCcZR1c7JGYCSOEhISWZ3tudHBwPN9wfPUpM2HEbAzqiKAno93VThS5u9j3PXoSshpH2PuSdo/Xo2gvsqnnOjrMmgGU7M3appt4bmGfhBRlpXfKY/2w666hMUmFBBjt9MKIzveEJzazmDS4NOWYSmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626151; c=relaxed/simple;
	bh=f+tAOEFe/ZozGHopzGMvkF4QvWQSOwN+hn+D23vyFKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqLTzaoEuskj3/v7CdVe2+SnMo0zcg99u56yGYHzyeCcbfj6iu1NQqrIrYRKxNRk3Cz+03FhvRiuI71HnPM43lXYY0W96bx8z7nopA2nGH0MP24NN8rZGY1KRg/9QrW4rneT8DjRfjVuKcOMHlfoR5Vi1aORYlYuoRT2bB/3C+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AduDbEKF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DpTOZS7x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AduDbEKF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DpTOZS7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784626148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3nIrtb3ZIx5YQo/Azj3k+CrJf5VH+rRdrIKrJmE4Ec=;
	b=AduDbEKFTDwz3OG91KzHNd0hWS58CWqps4txfhkyqcPRxnHi47PZSfYhbgJCwM9xQh0Vze
	PucLCjEsdttWcBQ64H6EL+3R5j2n9HYnI4d0Z2uHMbGwfNGpyZV6wX2OqmqCGCe1qGm9Ki
	RDJVYpjB1syC1Zv8g3yrWMxy5M/1/RA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-Bb8DfP2qMjusl-6EAmUKJQ-1; Tue, 21 Jul 2026 05:29:02 -0400
X-MC-Unique: Bb8DfP2qMjusl-6EAmUKJQ-1
X-Mimecast-MFC-AGG-ID: Bb8DfP2qMjusl-6EAmUKJQ_1784626141
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47bbe3b9705so10252668f8f.0
        for <imx@lists.linux.dev>; Tue, 21 Jul 2026 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784626141; x=1785230941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3nIrtb3ZIx5YQo/Azj3k+CrJf5VH+rRdrIKrJmE4Ec=;
        b=DpTOZS7xgj7uhicwu+hECbcX8Kc38e4BhmbutHm3ZuTLsyLUMyU39kaSf5jVIsy85X
         FbFtmaA+MpUbP6fi3ZQ5z/vk60Ious4Yqzsbgg87EHJWJdKLTEc6YFe915XmWBmKatw4
         rDYD7Kh7VK6xg++D46QpO1xS34CNHS/47kuilEtu3MJRSJTGlp0wOocB2t8zj+R6g/cA
         ZpEW4HEM8LgfbUSnaKIScgRgehmMLaOcx8MIwARmWo9MiNFMU81D+ie1t7K9soJFNDfl
         E/UyxyBD3ZJwb/Xcf1AP5LKSwnS87EBxkw2GzD7X8r+IwBXEngNOAVCsvu7EiW/uk/hg
         N6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626141; x=1785230941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3nIrtb3ZIx5YQo/Azj3k+CrJf5VH+rRdrIKrJmE4Ec=;
        b=icpUt695Ba2kdltieKKUYxHroVfoxSUiSvxguOyKHQ4JAzbRJQQD6rS9RHnwf35YQN
         pDRGMU9JZiTCd2D9hXKqvZGP0zTSChwgjUH/2jat16nx9v8Nwyv2I8CBVMHKwHYzYmr0
         2hMzxFJUqyK2jCKcZBkP5m+/qhv9nHvaS9un/4tUCwXWu70tbu1+vnV8qQH7/cg2W6xF
         qAeFhb4A2dJfKBmfI2FzByNAei+s1qTQb9E3XTc79N9yfZNZ6FjIBE2F++m5pnXvBQTN
         UgCpMPJfwxzAPcsT5i6R92Z+BhPnd56H2YFD079WwifAm227jYFunkCJfyU7AwnUEk/O
         mqmw==
X-Forwarded-Encrypted: i=1; AHgh+RoFve4WPOa6iGd7D2OBlCnE8GVmobdY2Kx/Hy0/hpX7uLkQSmJrj1XrsTO9xP7z2VOC5I0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0rI1eYB32BrYRZfSXOUS9sm3XZ1To+mNyTaHd8ToVlpZUB2n+
	I1+NMDYGnqUxYF/OxkOo/WrX3VeUhlL9ucr44p8HmMs8IdS1U9+ULZ1uhRl2wkLQTCnzCU6VZ2N
	LPEcUjJjHURCaTJHFlbMtV4kT1ylGn1zrUEf/YjIb4BSa2fEKbid+yzKf/TdgBxMl
X-Gm-Gg: AR+sD10DUjVn6kUTqU7/5p44awjHCtbcuuLy5KL9vMLENZyiQgXhDiiWXg4G3EnR5TT
	bFeMfUx4xGQ6o38zmM+lHUuoeCsRD8poEk+kV76ovDXt/qju7JITH1S8SooMjtGytFBsZU/R23n
	rWU2atY05ZHOVk884z7ww4KEGyCcaCWZQnqbsoR+BBtqQvyQYOQ+EXQs42Ldo5R+bVlimUeXVnO
	7NUyi8YYy1AaPz6lVdJPubTo4vKe6NJiVjV/v5OxlKZOOCTsJgFSeOr3+WoRnEncqXQQ+WT1IE3
	A71iK2+Dr2UwuWBJAF7h+iPyosx4dyrnSNDrsvKJM6Hqs5+S5e3vCZ7FUBJRBV38dqcA16vwAA=
	=
X-Received: by 2002:a5d:5d0e:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f6230389fmr22149619f8f.14.1784626140594;
        Tue, 21 Jul 2026 02:29:00 -0700 (PDT)
X-Received: by 2002:a5d:5d0e:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f6230389fmr22149546f8f.14.1784626139778;
        Tue, 21 Jul 2026 02:28:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:edbd:5894:eb1d:c2c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm39272808f8f.1.2026.07.21.02.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:28:58 -0700 (PDT)
Date: Tue, 21 Jul 2026 11:28:57 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, sashiko-reviews@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
Message-ID: <20260721-vagabond-lovely-loon-d126e7@penduick>
References: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
 <20260716091459.1D8101F000E9@smtp.kernel.org>
 <DK1XPK73QJHC.JWFUMTTLOD1D@oss.qualcomm.com>
 <63cca05a-ec83-430c-abcf-c2f0b508446f@suse.de>
 <20260720-bold-jasmine-goldfish-d979e5@penduick>
 <3749a60a-a8bb-45a0-a06e-a21017990c10@suse.de>
 <20260720-sly-tricky-elephant-c8afa1@penduick>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="svtaodo43k2a7zkz"
Content-Disposition: inline
In-Reply-To: <20260720-sly-tricky-elephant-c8afa1@penduick>


--svtaodo43k2a7zkz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0

On Mon, Jul 20, 2026 at 05:06:41PM +0200, Maxime Ripard wrote:
> On Mon, Jul 20, 2026 at 04:38:26PM +0200, Thomas Zimmermann wrote:
> > Am 20.07.26 um 16:08 schrieb Maxime Ripard:
> > > On Mon, Jul 20, 2026 at 02:36:19PM +0200, Thomas Zimmermann wrote:
> > > > Hi
> > > >=20
> > > > Am 18.07.26 um 21:12 schrieb Ze Huang:
> > > > [...]
> > > > > > > -	if (event) {
> > > > > > > -		crtc->state->event =3D NULL;
> > > > > > > +static int imx_lcdc_plane_helper_atomic_check(struct drm_pla=
ne *plane,
> > > > > > > +					      struct drm_atomic_commit *commit)
> > > > > > > +{
> > > > > > > +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_=
plane_state(commit, plane);
> > > > > > > +	struct drm_crtc *crtc =3D plane_state->crtc;
> > > > > > > +	struct drm_crtc_state *crtc_state =3D NULL;
> > > > > > > -		spin_lock_irq(&crtc->dev->event_lock);
> > > > > > > +	if (crtc)
> > > > > > > +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, crtc);
> > > > > > > -		if (crtc->state->active && drm_crtc_vblank_get(crtc) =3D=
=3D 0)
> > > > > > > -			drm_crtc_arm_vblank_event(crtc, event);
> > > > > > > -		else
> > > > > > > -			drm_crtc_send_vblank_event(crtc, event);
> > > > > > > +	return drm_atomic_helper_check_plane_state(plane_state, crt=
c_state,
> > > > > > [Severity: High]
> > > > > > Can fetching the CRTC state this way cause a kernel panic in th=
e core atomic
> > > > > > helpers?
> > > > > >=20
> > > > > > If userspace submits a commit that modifies only plane properti=
es without
> > > > > > affecting the CRTC, the CRTC is not implicitly added to the ato=
mic commit
> > > > > > state.
> > > > > >=20
> > > > > > In this scenario, drm_atomic_get_new_crtc_state() returns NULL.=
 Passing this
> > > > > > NULL pointer directly to drm_atomic_helper_check_plane_state() =
causes a crash
> > > > > > when it dereferences crtc_state->enable.
> > > > > >=20
> > > > > > Could this use drm_atomic_get_crtc_state() instead to ensure th=
e state is
> > > > > > brought into the commit if it is missing?
> > > > > I think it is fine here; I'll just copy the pattern from [1].
> > > > >=20
> > > > > [1] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/dr=
m/mgag200/mgag200_mode.c#L487
> > > > It could be that there's a long standing problem in the overall log=
ic. Not
> > > > having a CRTC (and hence crtc_state) should also mean !fb, so we'd =
return at
> > > > [1]. If we have a CRTC on the plane but pass a crtc_state of NULL, =
we could
> > > > get a panic at [2], where it does crtc_state->crtc.=A0 I'm not awar=
e of any
> > > > bug reports about this problem, but it's still an issue.
> > > >=20
> > > > A number of drivers get this wrong by using
> > > > drm_atomic_helper_get_new_crtc_state(). The bot suggests to use
> > > > drm_atomic_helper_get_crtc_state() instead.=A0 This helper also ret=
urns the
> > > > new state. But=A0 if there's no new state, it duplicates the CRTC's=
 existing
> > > > state. That's a bit of an overhead, but probably not an issue.=A0 S=
everal
> > > > drivers use this helper, but also get it wrong. They tend to return=
 early in
> > > > the case of !crtc or !fb without calling _check_plane_state(). See =
[3] and
> > > > [4] for examples.
> > > >=20
> > > > I think, going with the bot's suggestion to use
> > > > drm_atomic_helper_get_crtc_state() might be the best resolution for=
 now. It
> > > > still needs a crtc pointer, so the pattern is
> > > >=20
> > > > crtc_state =3D NULL
> > > > if (plane_state->crtc)
> > > >  =A0 =A0 crtc_state =3D drm_atomic_helper_get_crtc_state(plane_stat=
e->crtc)
> > > >=20
> > > > _check_plane_state(plane_state, crtc_state);
> > > >=20
> > > > And in this case, _check_plane_state() should work correctly. But y=
ou can
> > > > only use _get_crtc_state() in the atomic_check helpers! In the
> > > > atomic_update, atomic_enable, etc helpers, it's too late for the he=
lper to
> > > > copy the CRTC state.
> > > >=20
> > > > I think some other DRM dev should look over this as well. It's one =
of the
> > > > trickier things in DRM to get right.
> > > drm_atomic_helper_get_crtc_state is safe in atomic_check. It's
> > > everything after that must use either get_new_crtc_state or
> > > get_old_crtc_state, as the global state cannot be modified anymore.
> >=20
> > Thanks a lot for confirming.
> >=20
> > Wrt. the logic in plane atomic_check, we might have to fix a number of
> > drivers. As I outlined above, some use _get_new_crtc_state(), some use
> > _get_crtc_state() incorrectly. But that's for another series.
>=20
> Sigh... I removed all of them a couple of years ago, I guess some crept
> back in. Maybe we should warn loudly if it happens?

I started to look into it for drm_atomic_helper_get_crtc_state and I
cannot find an occurence of this in drm-misc-next. Do you have a
specific example in mind?

Maxime

--svtaodo43k2a7zkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal87zwAKCRAnX84Zoj2+
dpD4AX9mZR8Tsica/YCVr+szvbzpc2I1L6zbnMp7qBJPP5suVRXai0/c6lQELN2s
/orBPSYBfRNMFmYBwJUkOABk0ocUxGax7KlpNoG7ktNzSEMH72f9U3G/1A/5b/ay
jQHqVqGSZQ==
=QgDA
-----END PGP SIGNATURE-----

--svtaodo43k2a7zkz--

