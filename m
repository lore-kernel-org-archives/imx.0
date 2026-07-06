Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484543B6CE
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352197; cv=none; b=jYUkYVwYdK5y10Yjw5utz1Oc1qEup16KlWOHc4Yuv0ZDugAiHsA+9dbhmXjKfPuU01u3EBKzfkXidVhyAutGRJmP6BsDvJn6EL2aGKs4NsRIT7YIzawQrf1cg6rN3R709wx1FQjqcZzrELEvd1/7ew9ovlv4EAwNjD+qj0wTdLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352197; c=relaxed/simple;
	bh=wVbr2DHZpsrDLnip0gND0doGgeZzZfvqxIEQvpI30Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=f+C7viVruvaZGWNyJfady9+FMaqkcRJ5mf/n0xakQFzxGNZg21OgvHAlnv4jzfwXjDoWINtKbhG/yHybYaP4CwU3nkXD8YBMRuv2zlRbccQo9ZeHanFlsVEgeI5czo27wcBlqO1F+J7+6uP6/enrXn2L1exmvlmceW88lUJx9YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jBOmh2Ba; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jBOmh2Ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/lpTu6aBahDmOXbfz6cfxVmcBkiFNtxLGTXawIRGXSc=;
	b=jBOmh2BaRWQu4K4juolYLenyJuADDQCT0x1GPfbefjgdkkCWqZk5N01R1Wnxmju4aI/MG7
	fgjYtcb6JEPUDEYS9evqkmm/kkOY+7ixngsPYylCGAkxHzaz9C18ComqPDjx7vw7lk8DLP
	mTVxJnomp/PMv7sQj05cCCqnWYUy4a4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-Ie8bEXWPN_WZGmVECMzNNg-1; Mon, 06 Jul 2026 11:36:33 -0400
X-MC-Unique: Ie8bEXWPN_WZGmVECMzNNg-1
X-Mimecast-MFC-AGG-ID: Ie8bEXWPN_WZGmVECMzNNg_1783352193
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8068416764bso96748637b3.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 08:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352193; x=1783956993;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lpTu6aBahDmOXbfz6cfxVmcBkiFNtxLGTXawIRGXSc=;
        b=f64mf4jXqKMg+epnKmyy1nqJjplaN/WY79vV+vbn5BtCe1ncY7aoz87Isn1+0iJnvU
         F3NRgHkRDKBSf+j/1fOyFq8E9NI5NtFA2RI94c6tWx6oVa1YU48kVHaRTKlltAcaSabF
         HPEIqGPWRAYfil7Ho0uAGdImxuyByQSnA7AKn8CO8rdcV8EnltaY/xBsgwPOTPccqJJm
         X1EB583YfzCVl63aCC+1jlysWMvq+u/1RxqvG0o4k3i+U5o9TiREb5KdcBOB9wNMJ26i
         wPqK2Qmrdp7geu+ezXXMLBPYe0xCz8GipmFhQQad5gpfwCWvm1EFx9r96/7QVCJOMFlK
         yJGA==
X-Forwarded-Encrypted: i=1; AHgh+RqQMZ/oBWK8lnkb3sRS+brnh0l4umIRTZHVW99G49qnLzFPtB9xHN2EnkpNj77bUfBMMmc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVWrhYNLYHH++lk/E5LiUapFJ+CKrCbstRqYaXAGFg8jpqhKG6
	sykAs68xLVLXbhxRm2de5GN9SFqRh4YRy6es6snlo2Dr+XKKA0GiKHY9ouTq1kGwFpThIPQ4hH0
	bkuMWoc7+y4XsaeL8wHS6wbLiWGcWRwWFLQvoUHgljYO4Yo1bQQvvZQ==
X-Gm-Gg: AfdE7cliIs4Wr3De+qx03dTm4PYRsEIn1ABi/KFFH6Oz/n5BukefhRZlQR8jMggzyfl
	yTfQzfSBjH851kNK87OSHSrq7wrBC5VR8qpzC1+UAMfsEQ5WtBJ85QIVmE663oIHSuXyX/eT2q4
	8cvoS2ozDRJx+l28d0dB5VRlMfhAKzknqLiWl6bo9IR+2bAbnx6AyYRm2TBIIhbGx48+KfadkRa
	i6KgZj0LnI6BuhapRndcF6mdkvOko74NaF8uIYEQCVnUhGEq4qRLnVF9ZxUbynohdpokX6vD3S2
	XBZVjSiDkbcKFVOAOOCRfv12KnBFDS32IWPXGLVD1dWlod2mTtPRDsUddAOtiCGfRso97Y9qnxF
	bhdLMiv37/Bvw3fyfVGPgTduUSnTPGgZboXzS+YEjoKZiHw==
X-Received: by 2002:a05:690c:660c:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81be153e0d2mr6745387b3.17.1783352192996;
        Mon, 06 Jul 2026 08:36:32 -0700 (PDT)
X-Received: by 2002:a05:690c:660c:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81be153e0d2mr6745247b3.17.1783352192647;
        Mon, 06 Jul 2026 08:36:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144840568esm59088637b3.17.2026.07.06.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:36:31 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:36:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
Message-ID: <akvLfrL2TkhEnxbQ@redhat.com>
References: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7SFM-bzEo-YCEsCB75at-RImRtRJGB1PKQCaU9GQ_cY_1783352193
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 08:17:05AM +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

