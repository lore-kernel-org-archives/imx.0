Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D763346AFB
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 04:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788927232; cv=pass; b=JUDig9A9drAHcwXuwZWqNv5TjhzqSBekf3Hh2ihWSl6KQGm8F4IbBBbe4zbRmER0W1a3zluc3jd4asSZCvLwgmDch8yD2bhbssmvmEyer8BzALkax34GFYrJKztICSZqzNtVMRyFHL4GOV730kWCK30srjqMxFmFPbHd6B58288=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788927232; c=relaxed/simple;
	bh=VbbgDs8vchj2lrFK5eDi1gvI0D0IoQpaWTY+VveU7Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5sAycEkpbLaddfj6MHGhRYa+Z6YYGmZIrreKMFsElkuGaXACePO2aoVv5Of79BRoWayjHx0wNo6kb995o5lQVHGlbifsRDTWaVzuGrl57wjIbSWeryYVp4jcgsuPcNFTiE2NR+2UxWkr2/c3xFvVG8KnQ5unN2tTtSujGEdCL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCfbydus; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCfbydus"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso6463545ad.3
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 21:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788927231; cv=none;
        d=google.com; s=arc-20260327;
        b=d1eAi0W3+pPP4y2dmahNp74Stla2SqYsWYMdn8G4gyztyFH6B706FZFj6pVBRP1er+
         yFO1jO3HSVHRknFyCdn9IwXOP9meT50V0ESJ7lYxF2A0/tcaWLTUHWaECPrJXbQWR2nX
         Qcb4PHT4jscDOhNNXBAbcFWQt1hBQcgiYSWrN/wlEvTBSTOOAH66Qyd7U9bkFhczxWT3
         rlJmaLgbdDsuWobHtBViTVPc3wUca7JlXcW4BJl7S3fVgzQEN8Iz0iKDuCT5+m2dsoJT
         TyOJ0dHjMCUC9wxJsIQBOM/BE3UBtimro7h1tW2PMGx3+cZQsFRZWba2poa0GyUdoaI0
         pNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VbbgDs8vchj2lrFK5eDi1gvI0D0IoQpaWTY+VveU7Sg=;
        fh=0EqsyfrOYmQ+MBLW/iW3xE9bMO45xN83qt8BSi7Kj2E=;
        b=NcDtapmXW658S66MpCGIQPjoEx0vxZfuJSxDcZjqFwiIHjXe+E2npKUaoadBZyGfmw
         ZaEci72Pt1phO3zw3uAafJEPLCZLfSVUgpFDScOG1T4feCVM4124BfZnn9SZTApF7oJW
         PAZt7urPh0i6WMQpJ8THWxX5gOigyFfxC8DxAZAYGq88wUS1bWLCjI77BxOH+noy0JrG
         NEjYCwALfc/VSshi3fYtQ8qOJXzmK5cSCqs+3s9fkM04KCaMA+Yiq63CQC5KaLyCtSYe
         dI/DPauT3ICuDmbKXJ9u3QVT6GwlVQgnxInND6kqqdA8CUz9JNgV9QZKGGXzj8PI+DjN
         94sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788927231; x=1789532031; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbbgDs8vchj2lrFK5eDi1gvI0D0IoQpaWTY+VveU7Sg=;
        b=gCfbydusFCJAuKAXGybVvimEY+48UpjIgVtDmsJrqNKZwloZTzxZh5hcSfC5GfRpdN
         f2bvJQIXcIVTiOz/L7BwYIcJEXHzdeUN/gTUVgYr15jsme3vZ/390+3bLKUoRw+pJYaJ
         eKWPuP9APDVzPLlE9r+IFsZk61m+sQD8T9pHUL/zsdadcc4PUWWGNYYOoWeOm8IsxSat
         I4ENd0M6W4/2TzaWKP4jqoTTPI8Yuyjm8/tSbZFMYXQvTqwBrZASLv+idZ11LF4JDXtX
         iCxfu0zC2AwlevIbzi+J+IsC2Qmu09eo3SfG3aC6AgJ2lyKQPfymEO4IE/4P/pusdVjV
         ZQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788927231; x=1789532031;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbbgDs8vchj2lrFK5eDi1gvI0D0IoQpaWTY+VveU7Sg=;
        b=QSzE1OWlVs5KiC0AZ/ev/sM/BMAmrHhpW+3hRkpfT/igTMo9PJPzo12oGuAhQgRqda
         qDBDj5WVb+iI47lnXEn4krZjpA9Qx8Nm3th3KOZWFpCFTXgPNy/qbRREwyFmQG93EFx3
         hMAk/IRqYj7DPsp+S5dfqsBYnjyrJsAzWX7RyStygsvyENCxaGQp2Xfv5uBT4aPsPqkY
         znR6TMB47rR46FUcbeX4RQok9xxJDdUdcSOuOD3tHlT5pkNYQxt7lvL6BsjTmcjHf39j
         /YZgcJqtV79qoOlD/s0W8T+w2zAAVRf3rY4bXSJpGy7jmvVcEPBTerjdfTabb5U11UYC
         TuUA==
X-Forwarded-Encrypted: i=1; AKwUvBwOR2mHmvQIG+yXHnr3iZmNkEExdQlnEK+8gOVAHrrWVehBqt4nJw6nJNQYZYVbp644DPg=@lists.linux.dev
X-Gm-Message-State: AFuF++nVvhGgM6m0HI1dl/KBoPs8CPGea81hpPypp13twLb/U633S/0f
	GVBuH0QdEnw3p8d2u01aEzEKeaMZLy2EbrqhpGkTPLuZE8YTbm17QxgrYx5BPbbGAZ9eoBwT1bC
	RHFHbIFRQ7ddhS0j1HKPnjzW+rxcmMHM=
X-Gm-Gg: AYBFou3WnBANw6dkQ7Ihxtykr7sVq9NPgRDvy5rz8w6PEG9RbON5Xtea9Jk2BZ9MwDM
	7z1Mt/VCPfQhFbahFOsXkd5zC+b5NlUlosrLCp0q3qo75gOwKVvDnlTyoMK7oewGbqHfKU0PJNo
	avqwghHADj3fBNqEToT/RLP+5SqBNkSgzZMuVsk3iAIELkI68tgI9oHevAuaW8C5PMrOaRcny52
	XhmRuMEuafPh4CsOG1XbiOWU/rhPa/z6Df/xpdGgBEgYEd40gke/FsuX7EWR1nAhehCbBIBCpOE
	gJav8beCZlNXi1LhoxOQ80aJiK3bSRJKlYjxevOqJCOfawyTFmBSN+KwC1baO4WpXfKo9cDVCgU
	kus0R/pUGVsj2ufhKk/SO7hG/1ZtkpqEDO85r/CrVieA7nDQUyXo35GvUUKtogzGfoUk=
X-Received: by 2002:a17:903:26cc:b0:2db:56da:6a0b with SMTP id
 d9443c01a7336-2db8dc82083mr45104355ad.13.1788927230886; Tue, 08 Sep 2026
 21:13:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907034502.12619-1-phucduc.bui@gmail.com> <20260908034531.CE7F71F00A3D@smtp.kernel.org>
In-Reply-To: <20260908034531.CE7F71F00A3D@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 9 Sep 2026 11:13:38 +0700
X-Gm-Features: AcwNN1XH4hJEZ2rTmXzpWJyneeiZmqrcyvq1QfRWHmkaHeVbO6yDhYnSn862a4U
Message-ID: <CAABR9nGL0M_Uo=NZf-dCBg5czze-7LGo1a=AA67GbdF6F9-JgQ@mail.gmail.com>
Subject: Re: [PATCH net v4] net: fec: Propagate PTP initialization errors
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> Pre-existing issues:
> - [High] Use-After-Free when an interrupt fires during probe error cleanup.
> --

This issue is addressed here:

https://lore.kernel.org/all/20260909-fec-ptp-pps-event-uaf-v3-0-bead12c29a16@cherr.cc/
