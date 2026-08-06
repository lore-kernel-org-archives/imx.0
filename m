Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4738E8B2
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 05:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994088; cv=pass; b=FCXgmGjhU7ut/6KiUmb8SHKgWUse/pIE0xN+JHtZpVZarB90AdHui9JvBpQ210CFiEeeHM8HokCSZ/b3su8Xd+gAPqVD4BZtaw5idf2iF8gqiu/XqkiJxYVUETOrvCIlp9SCs/1KLP8MHovuer/TcJbAMOxO6MlX3O2hX619c/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994088; c=relaxed/simple;
	bh=eQ+aEV/7pu/3GaCoFwag/RdEt/0S2Jc3568qzh4F/UQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sieJPzmuOBiGuQPphC75sd308lkfjW6fwnIgRoS1UK4QCAobJNSsffR0BZoBPWFqg8Qtbak4MJvF4aZESW7vEWThs8SHEEP5Fzn2CffwjfRaG5WaK/Hj5mprfSiDtRh+AJjtN5DRydqy8AQwxLKyYciRitE1ZU9n6iyVSHIeItQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZbfX6oR; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZbfX6oR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce98cb8165so7151415ad.1
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 22:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785994086; cv=none;
        d=google.com; s=arc-20260327;
        b=SFfGF41ykJmm3MXL6fZH04l1S8qy8o6/YEf/oe/UE4vSUMgkqbyyFT8XYkh+Pkllns
         83EfPeMbWcJwiCV5PZY2RdVt3VXFBHszXL7jl7LfH/8CLIPx0SsouyM1sieGHMggkash
         aVuUUIwYwZ76y2VpYTPba/c9Iqn01TvX+Czlsl0sNp8UyJTVBIFD0/z5X+QXxF2njNWs
         nKATkkwnwQlFnF8YNPazhoyMgMAZyikj2NnMDF+oltIupQ+u6xF8osz/7y1HyMqAwd8l
         wcA4csE/uow7vfAX3XUarJl4P69nQAHQEBm8V7pQ+Ng0nWRhNnXusADeQv+vqmUsajSt
         BIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        fh=hwNOt5eUwe50OxYBpZICERw/DTiI5yWXzh+OM00CDqg=;
        b=ccmz7TSbS3IUbWekiATulIpdRLdTE65IsnNSi/BqLB1Zq8cGgIfoE/uQXeCndcRpSV
         ICaaNIaA9trM/eC37tv6N9j6me3afoZYkZwf+mE3/ImDASt4MmfpKIuXvuSITsCAnyGn
         AJNnHHRmNS1RSH8j8dl+6j+5VPiURuoAbJI6tXBSRDfC2s9lztjk3PgMA6nHBhjjBXkv
         LHuvvz7p1F3gg69dZGHGp21o1ddz3mv4wayhuWpoMoDacQSAVe4CcDmwp6xpVCDomOUo
         7lFfMBN50n7d1gl+tnzw6rsoDKn1GoSwuuNTjuDwb70xWBtnTmSKQTmLlMWGKqAf+/sq
         m3Fg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785994086; x=1786598886; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        b=mZbfX6oRcGsWQ0rBelUbhjr//Dyn8ZSCrgH0wqfv/tnQgQHianTRv8nQdbPg5Pf058
         dnrBiWizvzA2qghIP6HkFCaDTEKmyIddcEb/Zfb/qw0PXWwxPu5hOU1U/HQsUBHJDGjS
         ZbOz2lpaB5VgPtEFdTo2kIutqc9ceVxVg61U73WPc08zupB9s2NdRmDde8q0KXouQbf2
         geZ8OHNgmdPDbSwVVcp0N8EaikajV9IreKoX1Lm4+Wd8Huk4b5/cW+64vSOb3u3VL5cH
         EA5Y/ovx3l9TlS16+SQSOtlQpEIVS0oKbSaiBCmYZr2qleIPn7qFyhIyxhwZSk7hJ//1
         MMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994086; x=1786598886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        b=jCEXFSV768fQT0PD5OTftNHdXnfbcRhiT52xm3WwEZSIx7coU/gxpbUpfqXn4t8S1e
         AmCCnP1jjltoaj02DwLD27EdIIepS5Pi1YgJ0xhbAm3xEyI/6U+74UFwRehhuAkKJg8O
         KeRBDbytiMPOvV6KC51seOsvmtz76naRX4AwYK516cmnGTtmZAQXjzaYuwvVZGQRb1fr
         upqhrD7z/8bPIYfNeM/9YRVrzOM70JpEc+FOYlv+FcTStyZyQ8UAgiRGkhPDbR2HU9Wy
         veIPbTN5ZCLFpTyILjTW2dCD9P5r22/IKqS5jTiPVTa3mJ63yJIlwtrJ4fy5sJh3xZsy
         a5JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr53WI0uYGNMwS6iEno8MfsqfO4YgIheBDG9r5qBdKA2GBYy5m4uhHih1aYiy+Of+GezPs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqtVzSGUIsSAj1orTPShmZxLJbC1dlqKfYIVOhTUW7x2Lxpt9f
	l2COgyFD0VO1K2Zk4vzdAY/Ig3CQkyULSD/WOOooHY8prk7jKDYTQGDu+w5ZD8w9INYDhMW3gDH
	X8FgP7ROTNkd4n1Yqst1iuBRQRkIgVIc=
X-Gm-Gg: AR+sD12PzCXolt2InkHtX+kU1z059cLLKI4eDXn3t4mD8wOvwfYUlMnlqr7WLR6k2LV
	3kFf5fGmoSeo0478GBL/wfNzBIHcaMjHAgrDFLmSDtUy1281V4E7dKKbOiccj6vUTUjzP+QoE9P
	O3LJRl82AbjsevLhTTl4Joeke/cEE6wh6Z075qrH/abz0FhvAOJ8Ix32/dVEzPrjR/lzrgocvCw
	8izthFIC1aQpTH1Npc5viQEuPZtNIk5Vo6ADCWM3jNt7noKhusLH7qJDXqSx8eyahryQagyl7vd
	bKJ5X2j9hTn4bVwVAR9WHJmuvr0zS23tUBVjhMuyf8wO
X-Received: by 2002:a17:903:228b:b0:2ca:eff:ff58 with SMTP id
 d9443c01a7336-2d0f710991amr9793645ad.15.1785994085793; Wed, 05 Aug 2026
 22:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <anH5i7y3JkB1moee@SMW015318>
 <CAA+D8ANCoc5qOUvTQPRNkvrfqAY3n6x_fbfUveP8Sfv+SL1NVw@mail.gmail.com> <anNtgkZYhoWsSRr6@SMW015318>
In-Reply-To: <anNtgkZYhoWsSRr6@SMW015318>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Aug 2026 13:27:51 +0800
X-Gm-Features: AUfX_myhLzhOuWWyjCG9X66ATeLQftPHIJVdiIW_bTxwa_fBiVstKxt6vFHm5B8
Message-ID: <CAA+D8APMT2eSgrc37n_YZ4PsDZ-_8h4gHsyhADGGYDpTob_g+Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 1:06=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Wed, Aug 05, 2026 at 02:57:59PM +0800, Shengjiu Wang wrote:
> > On Tue, Aug 4, 2026 at 10:39=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com>=
 wrote:
> > >
> > > On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com w=
rote:
> > > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > >
> > > > The i.MX ASRC hardware supports up to three conversion pairs (A, B,=
 C).
> > > > The existing binding exposed only a single generic audio-graph port=
,
> > > > which cannot represent independent conversion paths when multiple p=
airs
> > > > are in use simultaneously.
> > > >
> > > > Add a ports container that enumerates up to three sub-ports, each
> > > > representing an independent conversion path:
> > > >   port@0 -- conversion path 0
> > > >   port@1 -- conversion path 1
> > > >   port@2 -- conversion path 2
> > > >
> > > > Each sub-port references audio-graph-port.yaml as before. Hardware =
pairs
> > > > are allocated dynamically at stream open time; each active stream
> > > > direction (playback or capture) on a port consumes one hardware pai=
r.
> > > >
> > > > For backwards compatibility, keep the old single port property but =
mark
> > > > it deprecated. A schema constraint (not: required: [port, ports]) e=
nsures
> > > > that both forms cannot be used at the same time. The binding exampl=
e is
> > > > updated to show the preferred ports form.
> > > >
> > > > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > > > documented single 'port' node, so this change does not break any
> > > > in-tree device tree.
> > >
> > > if no existing upstream DTS file use it, you can direct replace with =
ports
> >
> > That is to avoid any downstream use of the 'port', so not directly repl=
ace it.
>
> Does downstream strictly run DTB_CHECK ?

I don't know if anyone downstream uses the 'port' or not.  so keep it
in this file but
mark it is as deprecated to avoid any impact of this change (add 'ports')

Best regards
Shengjiu Wang
