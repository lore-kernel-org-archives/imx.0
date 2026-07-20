Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3242A14B
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556540; cv=none; b=JQq8DJb7jsDFh6jM4eRMMVncy8AX+d+eK6Lu/IwJVBuo+WqonScQOzH+zMQEIWWmdGO2NF6/3Yq0uP0Wx/mqaIUe+psE9OioYqxkrpyS6PTZ4HaJrXVzINNnqrDij0/wJ0z1bkDveojvjPMjuQPbFt8CrfzdO6A3wrCOscQrdv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556540; c=relaxed/simple;
	bh=4/QLGXVN3YtC8wbV86UX79GdVGNiO0IzNFsiHKzoyk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LO8DFB/SW0KLab5wljqyyAIhJGI97bTiGAhQvxIesGey0Ox+BJPh8SWPUQRH2FJ8AqXKpfcxd2UJnzdpDoWDnq1yWFCSeFzpcJoyhqhVZT8ol3IyEoj0yHVXFNYpPU/g3C5LyV/K3kpZ9HVkulN+Lh+cPprQis3maQlp3lrG+8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BtwYG2No; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uq9QTgzO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BtwYG2No";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uq9QTgzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784556537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bYhdFOpmK669qfgd8VOdJ1wWxaKRFhsnw8y+lE3N65U=;
	b=BtwYG2NoRblnK9DD0FBnMTZhS6HfWm/EsD0HS3nDBB4Tt3eFSse69I6P3+cKPg1DcVy/yM
	ZjgziuuwBvKxW3g3XvEKpAJMJGj/JOSX9qRSXf9823SsyVlZM/3Um43E1OJ8ELW835ktBO
	6v46eVgWmYABzD+P0Mr/E0v/8hspnqs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-U3X5ub9IOFi6MwEP0_-qkg-1; Mon, 20 Jul 2026 10:08:52 -0400
X-MC-Unique: U3X5ub9IOFi6MwEP0_-qkg-1
X-Mimecast-MFC-AGG-ID: U3X5ub9IOFi6MwEP0_-qkg_1784556530
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47407691804so7174680f8f.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784556530; x=1785161330; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYhdFOpmK669qfgd8VOdJ1wWxaKRFhsnw8y+lE3N65U=;
        b=Uq9QTgzO4f7Wjkb76TN3aNBZS8HuDhu22p40axPQDZT2rP1xPmEq2KawL4dk7VbIvK
         xLvdwGXDBDKR0cIpfa9KMlFMyBWW4Ftd80+htgWZuHA8+J0cu/mMJuylTlxqwK5kGj+1
         cvFkyibykSl/DPVgA3c4hUiKALK+ycCEIsKM9Y/ciLHE8nnLIWQlloj2pTbBSNQSrHQp
         ikwP0XhS8CdaeoBQVyEOVmtooev/efeeX3V7l5ETa4wt+6ZKd7It8WuNCKsfNPg0T/7M
         4qr35MdggAk4Zsx7cGkkKuD28jzJYRs7gANpI94QoeVfYg+CIZL4gpQEM7VENcUSuYk/
         +e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556530; x=1785161330;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYhdFOpmK669qfgd8VOdJ1wWxaKRFhsnw8y+lE3N65U=;
        b=YUxdTaugAbtRMGh1+s6EnA+Yuk7vcDoGCXITeD5KNJwQSEhedeNO0S+NX18wrjeOPf
         iLo2QirzW1BgsXdiiJu/3sOhaPcJPwqnEDPA2HEa4bOqLPhEp6Z+teZdSsC7q0zAssNu
         a5IS/kSSedVrNukmakb8/Dx2VczYEHJaRB/6hZVtqa+hIUzmPiYWrPVFc8eesyXt8dcJ
         qqVs9AWm2dNoZIrSKaqrRIOcCWNNqg34VMtBZ86LfQCqontTW4nKgJmQ63ejsLC0UZDH
         Xklp+j0qA3L2QD+cDpMPWJsaHUNn8YnXsXb+gShmq2zTgzeIJZjGZk+ZVrdYcIq5guc6
         AHGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNCVEBShI5c1M3I1BNavZqw1FXVHLJJo1j83SDHaqY/K0RSwTPDn52Q3wePRsYta/p2vI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKCKe7Cg/567BmD/7W0S5tCTa1sobaRqB4V7qljm8BMVdNcT13
	4F+F3EdyW4TqBa+Kgr9ugVKAVa8aEk03dtm/6E1kglD9qN551rZH0+Vuhhm67xktar1RdsKyQDx
	k39CBSCbt206A/N8x4sLAwC4HPVEkojf63hS1bcNAVrqD2SkUTBGejg==
X-Gm-Gg: AfdE7ckggBVgT0UPO46bE4MuWsOy5afIQvFnfBRFww4tLOK70/atYnoDgfO2iM4IAGX
	PiIlP35X0RzkUUo2VFp2Zqncf0lUkQIClc65qXxXYRrgPIvnPtnDLJvVJqJSS5t5JysK4ff0c5A
	LdVHgo15HA437zTzUfW5Kxt7CK/BHsMazkd2UfCeADhQ5fxCP4iSRmbhBcTJNNZnNH+m+pzyuMs
	bFLgcs8j0+1Z3ZAmdfsvSCu54tRHCAYMkjanEFSJR6cATIwwvRYqH0OeFmSJYpdwyAu1pzxCZm7
	a1VXAzAPnn4ca+JVq/3XeMJrp9/6+VoewrtUmberYzy5txw9WIJhXH9a5wnrL7LFDd77bi7mDQ=
	=
X-Received: by 2002:a05:600d:8486:20b0:495:6022:5a20 with SMTP id 5b1f17b1804b1-49560319fe9mr26968525e9.33.1784556529554;
        Mon, 20 Jul 2026 07:08:49 -0700 (PDT)
X-Received: by 2002:a05:600d:8486:20b0:495:6022:5a20 with SMTP id 5b1f17b1804b1-49560319fe9mr26967995e9.33.1784556528895;
        Mon, 20 Jul 2026 07:08:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:edbd:5894:eb1d:c2c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm28394845f8f.4.2026.07.20.07.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:08:48 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:08:47 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, sashiko-reviews@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
Message-ID: <20260720-bold-jasmine-goldfish-d979e5@penduick>
References: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
 <20260716091459.1D8101F000E9@smtp.kernel.org>
 <DK1XPK73QJHC.JWFUMTTLOD1D@oss.qualcomm.com>
 <63cca05a-ec83-430c-abcf-c2f0b508446f@suse.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lkbwojfab5zeg2qh"
Content-Disposition: inline
In-Reply-To: <63cca05a-ec83-430c-abcf-c2f0b508446f@suse.de>


--lkbwojfab5zeg2qh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0

On Mon, Jul 20, 2026 at 02:36:19PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 18.07.26 um 21:12 schrieb Ze Huang:
> [...]
> > > > -	if (event) {
> > > > -		crtc->state->event =3D NULL;
> > > > +static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *pl=
ane,
> > > > +					      struct drm_atomic_commit *commit)
> > > > +{
> > > > +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_=
state(commit, plane);
> > > > +	struct drm_crtc *crtc =3D plane_state->crtc;
> > > > +	struct drm_crtc_state *crtc_state =3D NULL;
> > > > -		spin_lock_irq(&crtc->dev->event_lock);
> > > > +	if (crtc)
> > > > +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, crtc);
> > > > -		if (crtc->state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
> > > > -			drm_crtc_arm_vblank_event(crtc, event);
> > > > -		else
> > > > -			drm_crtc_send_vblank_event(crtc, event);
> > > > +	return drm_atomic_helper_check_plane_state(plane_state, crtc_stat=
e,
> > > [Severity: High]
> > > Can fetching the CRTC state this way cause a kernel panic in the core=
 atomic
> > > helpers?
> > >=20
> > > If userspace submits a commit that modifies only plane properties wit=
hout
> > > affecting the CRTC, the CRTC is not implicitly added to the atomic co=
mmit
> > > state.
> > >=20
> > > In this scenario, drm_atomic_get_new_crtc_state() returns NULL. Passi=
ng this
> > > NULL pointer directly to drm_atomic_helper_check_plane_state() causes=
 a crash
> > > when it dereferences crtc_state->enable.
> > >=20
> > > Could this use drm_atomic_get_crtc_state() instead to ensure the stat=
e is
> > > brought into the commit if it is missing?
> > I think it is fine here; I'll just copy the pattern from [1].
> >=20
> > [1] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/mgag=
200/mgag200_mode.c#L487
>=20
> It could be that there's a long standing problem in the overall logic. Not
> having a CRTC (and hence crtc_state) should also mean !fb, so we'd return=
 at
> [1]. If we have a CRTC on the plane but pass a crtc_state of NULL, we cou=
ld
> get a panic at [2], where it does crtc_state->crtc.=A0 I'm not aware of a=
ny
> bug reports about this problem, but it's still an issue.
>=20
> A number of drivers get this wrong by using
> drm_atomic_helper_get_new_crtc_state(). The bot suggests to use
> drm_atomic_helper_get_crtc_state() instead.=A0 This helper also returns t=
he
> new state. But=A0 if there's no new state, it duplicates the CRTC's exist=
ing
> state. That's a bit of an overhead, but probably not an issue.=A0 Several
> drivers use this helper, but also get it wrong. They tend to return early=
 in
> the case of !crtc or !fb without calling _check_plane_state(). See [3] and
> [4] for examples.
>=20
> I think, going with the bot's suggestion to use
> drm_atomic_helper_get_crtc_state() might be the best resolution for now. =
It
> still needs a crtc pointer, so the pattern is
>=20
> crtc_state =3D NULL
> if (plane_state->crtc)
> =A0 =A0 crtc_state =3D drm_atomic_helper_get_crtc_state(plane_state->crtc)
>=20
> _check_plane_state(plane_state, crtc_state);
>=20
> And in this case, _check_plane_state() should work correctly. But you can
> only use _get_crtc_state() in the atomic_check helpers! In the
> atomic_update, atomic_enable, etc helpers, it's too late for the helper to
> copy the CRTC state.
>=20
> I think some other DRM dev should look over this as well. It's one of the
> trickier things in DRM to get right.

drm_atomic_helper_get_crtc_state is safe in atomic_check. It's
everything after that must use either get_new_crtc_state or
get_old_crtc_state, as the global state cannot be modified anymore.

Maxime

--lkbwojfab5zeg2qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal4r6QAKCRAnX84Zoj2+
djhGAYCtixMssCdv8dqBLhL8AGCbqHVEcB24miO1/lrC21m8xRJjw/XtwiTe9uk3
u4LZbpABgJqkOJIhKLmzGuvYfOvGsyd49cCHHxPbfZ61/iBr5yCbvhnk0bm7yW/6
PWaUe1AQtQ==
=Kjek
-----END PGP SIGNATURE-----

--lkbwojfab5zeg2qh--

