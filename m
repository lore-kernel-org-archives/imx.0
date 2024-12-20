Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71DC218AB8
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708420; cv=none; b=mCxmiaBpmFNjtkxYlF0qNA5LdOnLx6LmkBQiPG56ncoNGjEZuitKBv9GwB0vxEyeeB78/bKUyStziwpeoQNonEtpWp5RwH0ar8uxVr4jng/Gie05UthE30YXfMlbPQiuSkiN6pHRObqCFGZHe3q9lbcBH2b8RnPjFxD/f42AZns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708420; c=relaxed/simple;
	bh=B7Jar74UlEAc5Zz/Tm7QzRK3yjHSA+2yIJw7aNVQxCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7LAoOLHLeVZPbF4Bqf58l7T+KAdUiMz3fCSAJKAR0rBQL5ojXFJxHOgPZ9+YZEoJclVVDZ0B7tbF7FY3BtJKa7eMaZZIJrZOltpkMyb1dWOWKsZNoO7Lb8hyME+80/1FpQAzgXBI23UorDBpxstsrI8xAfP3pjHFtnW5voU+gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVPqWGKm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVPqWGKm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-218c80a97caso18002625ad.0
        for <imx@lists.linux.dev>; Fri, 20 Dec 2024 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734708418; x=1735313218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsV9DFAZTZ+VyTBPQiYpJZXRBPd7DhEFM5G5rn/xIBo=;
        b=JVPqWGKmwcZ9kEoa4hidH5/m8QuEpFQDgO42i/GNUVxKBBWg8p5HCMZq47dwVu+5Re
         Geemde9IlHjZX4NG2PCECMp+nvwKTXovOmS3MmR2iJdBvx60nXxHiSUXNmGMt/S64CoG
         0CxkVBu5wM7Qv1XyCPZ6QimuRTLdYuEfKpWaj/chJa/n0I6NUggRffVtjmiCNm6qm2qK
         Av1Ub2yo+6coec/38GWHgDtgSHNT1D1sBG4ofnlescbE/Lj3zxqlSYAbJb7qCY05Q7L7
         igmzfGOcJ6aDnLYbsLQCByoIKWWpgmPkwcsiLy7J7O9iaWDA3lo0wk62TW8kzEGDuzB5
         P7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708418; x=1735313218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsV9DFAZTZ+VyTBPQiYpJZXRBPd7DhEFM5G5rn/xIBo=;
        b=O9L5NYWpRy1iYd+LCT8sQdOUEIzZ40/NIAblt/anft/TaWOMAbDc3IjcW3eYslz1OH
         yG3aKj/UkISLTJRThs+HzkDA0QryMl2MA16quVVJJf4P11psHwQxeRh7DDZCc9+YPaA0
         kAIzZuO7anq2ZkqdHtC/Zp25RrweFHH02p0yNLTbzY3vNUMoqesIS+1rB2HoF8Fse+QD
         Lat2iZLRs9VYX4nJZL9sWV4Qas49fzSghqmC4J6rUwvqsfWPB6Bqbt0BVnEPfT2v9+r5
         DFZ234NFxvFcrAw3+exNmooNtCujePhQmqYJmPImTGKawq4/0mKZ/2F/lGUJZsYjfCRt
         HmSA==
X-Forwarded-Encrypted: i=1; AJvYcCW7JKp/ZEGHia4VZIc8kcoZi9sL+dKmlEvs6JPXB/O7m49pFhSK/KUYCTyl/K1DcsotTc0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSTW2ssyXdTJhX2vNMB9g8bB4nbMiamCiFVxQXYdGFsel1v4Tj
	klqwmAsqPCPVU3mKpUQV4bb+g5KSx7subJzkxUI4wUPLeGHyWS8=
X-Gm-Gg: ASbGnctokvqsvVt8SRfJo7LUx3AVL7M/pMTv0qKAy3I31gq1E3an4tajT/yTjhrK+kf
	RTgBEjVmnp7xI8AOFt/p4ul+4kj07TOxGZ9Czas0mJ0gpvK0ni0K7Epaiwxs7vp8sBIeAlutglz
	/m2kn75ubHHtSgiVeiypES960RIB1z37xDw1LyiAoWJDcO2jucT94zlJVSzxBJeQp3O9sb5lLvg
	q7yale6CANUIf4M/1rEjWsR40oIwQVVrjlT0UAXxqjW2nS25waNymV2
X-Google-Smtp-Source: AGHT+IHz9+7bOTzRfbdXnya+sL1oqM0dpu0HPvuM/yUXMazVgXdFgCL+6D1K17jv+LV7lZUZX7em2w==
X-Received: by 2002:a17:902:f693:b0:216:1367:7e48 with SMTP id d9443c01a7336-219e6ccdcb2mr47583195ad.0.1734708418153;
        Fri, 20 Dec 2024 07:26:58 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96ebb6sm30518565ad.95.2024.12.20.07.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 07:26:57 -0800 (PST)
Date: Fri, 20 Dec 2024 07:26:56 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net,
	kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com,
	andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH bpf] selftests/bpf: add XDP_UMEM_TX_METADATA_LEN flag to
 umem_config
Message-ID: <Z2WMwPc9fj5kHcul@mini-arch>
References: <20241220091806.1856223-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220091806.1856223-1-wei.fang@nxp.com>

On 12/20, Wei Fang wrote:
> The Tx metadata test has been broken since the commit d5e726d9143c ("xsk:
> Require XDP_UMEM_TX_METADATA_LEN to actuate tx_metadata_len"). Because
> this change requires XDP_UMEM_TX_METADATA_LEN flag to be set, otherwise
> xsk_buff_pool::tx_metadata_len will be initialized to 0, which means that
> the driver cannot get Tx metadata and cannot execute AF_XDP Tx metadata
> hooks.
> 
> Fixes: d5e726d9143c ("xsk: Require XDP_UMEM_TX_METADATA_LEN to actuate tx_metadata_len")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Thanks for the patch, but it should have been fixed recently in:
https://lore.kernel.org/bpf/20241205044258.3155799-1-yoong.siang.song@intel.com/#t
