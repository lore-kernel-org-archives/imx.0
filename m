Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81A9455175
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835134; cv=none; b=CCnsrTxSC+d+0q5fi5UzcHDwHhpHmaUFzfhLag7nTccKHtmvneJP2XVL+tA6txJ8dQbj+yoKRAexnhi0dxeJSsL4FjhfLoI95Zz78aaeIlrVSh4pML6WZ10e+GROB0cUxJY97pZJIO5CY2mOuYURK6WW8Mlc6uNgx6jsWIVYldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835134; c=relaxed/simple;
	bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nj/zLKnSj87k/NofvTvbYGff8AGklQJiEle8+OelzmdHca0ydYrO05ghmooWKlgdc25ma+I4g7LKCFQfnPPXsIdFleGyA3CSAwz9OplLI6yOq1PeBqtl4EO7aDbBLVsALqCm15E+O5sxWYi85Cep1jAvyaQlfjQZSegWT7IXB4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SVNIjtSA; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SVNIjtSA"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so50017955ad.1
        for <imx@lists.linux.dev>; Wed, 30 Sep 2026 23:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790835133; x=1791439933; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=;
        b=SVNIjtSA5sfJStkYhT/gNDI72uWR664vNGOTNnTJIQgIQhXi0WRTur9VzYS0nZllbR
         liwVtk3GZT3QGbrtkiQWzjXWp3W4QGkYwXBv0logX5wKi6JH9NihfpNdRJiMsEVs0qJF
         yRkYdGqYUPhViI9Ga1hBdGHdAPOo9mm3wPlE8o3XVbLZs+Ce9lzKZBLQc/1cKbcW569s
         SCP5vpmFOz7fEExrrjbmBFqzFog4xWV/AHa6fvldc+7kBu+9YccUKCRuB7mJkM8/0UsF
         avuDM5Tn1ImSDJwXyrOQ0hucLzO2+PK5fUmsrsNydJFQhO/Q/4n3mm7Ol6FTlzW0tHQL
         pBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835133; x=1791439933;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgzBsM1JA4iQunu+Kx2XkRq0fCFr3hYwq5VUH7QKHsM=;
        b=0tgIueycQUN/V37zxwn5Jpsbu+EkxUjCe3lrtmZGKCmOdbnTdMcQP0Uo8Qto2iYC2B
         fqq5dNgAWWE5Tj5rDmK+VqpMb1vf6opNKaClvFGSWSo0Z5uiDIQihwrQtp2J+7mHs0os
         BeNWdQkoEvBAMVfjg5h0Ja3K8ZG8ZvPeXknB8dlRXimn+NWFAEdzRjAwEgEW+jn0x5vv
         qEug5geWinDBdfajpmpWo3jf8rV5jmkrpcjxjuuTwLAXbz6JWGh/9377uIQTvwswgR1G
         2oFWr6sOskFW3H4P8wxxil+16vuzLn2qTCTb3yrjXCk1bttC0K7IXC3E7UmyeikA0A/6
         n7hg==
X-Forwarded-Encrypted: i=1; AKwUvBxhfcPgyashAjnk/FIbqrhBGx2GU1Ya56QYn5Pa2hBw6CwYMcmbuRhYhcMRoBUwUjdZvP4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKTF3V63KU8tkFW5yT61DOPwYk3upW0KAguVTOOfrKfIenVyBjf
	2XpSWG5fG1Gh/+4/3fDmySY+/MRsLIf7Av5QfF8W+qKmugrX5AVjdn90lTl4Ql5/gVcH6yISxsx
	JmHBkqSbHPzCAppJLw2eIqQ==
X-Received: from pgbfq9.prod.google.com ([2002:a05:6a02:2989:b0:cc7:a60d:9a9b])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2c10:b0:2df:ab36:f145 with SMTP id d9443c01a7336-2e2e4bd212cmr32095185ad.68.1790835132740;
 Wed, 30 Sep 2026 23:12:12 -0700 (PDT)
Date: Thu,  1 Oct 2026 14:12:10 +0800
In-Reply-To: <20260929100946.693962-5-larisa.grigore@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260929100946.693962-1-larisa.grigore@oss.nxp.com> <20260929100946.693962-5-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001061211.4142384-1-stanleyjhu@google.com>
Subject: Re: [PATCH v7 04/12] ufs: host: Add common Hibern8 TX FSM polling helper
From: Stanley Jhu <stanleyjhu@google.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Pedro Sousa <pedrom.sousa@synopsys.com>, Hannes Reinicke <hare@suse.de>, 
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2026 at 12:09:38PM +0200, Larisa Grigore wrote:
> Factor out the common logic used to poll TX_FSM_STATE until the TX lanes
> enter Hibern8 into ufshcd_check_hibern8().
[...]
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
